if (!globalThis.componentsLoaded) {
    globalThis.componentsLoaded = true;

    globalThis.fetchNui = async (event, data, scriptName) => {
        const options = {
            method: 'post',
            body: JSON.stringify(data)
        };

        try {
            const response = await fetch(`https://${scriptName || globalThis.resourceName}/${event}`, options);

            if (!response.ok) throw new Error(`${response.status} - ${response.statusText}`);

            return await response.json();
        } catch (err) {
            console.error(`Error fetching ${event} from ${scriptName || globalThis.resourceName}`, err);
        }
    };

    globalThis.useNuiEvent = (eventName, cb) => {
        window.addEventListener('message', (event) => {
            if (event.data?.action === eventName) {
                cb(event.data.data);
            }
        });
    };

    let settingsListeners = [];

    globalThis.useNuiEvent('settingsUpdated', (settings) => {
        globalThis.settings = settings;

        settingsListeners.forEach((cb) => cb(settings));
    });

    globalThis.onSettingsChange = (cb) => {
        settingsListeners.push(cb);
    };

    for (const [name, component] of Object.entries(globalThis.components)) {
        globalThis[name] = component;
    }

    let addedHandlers = [];

    function refreshInputs(inputs) {
        inputs.forEach((input) => {
            if (addedHandlers.includes(input)) return console.log('already added handler for', input);

            input.addEventListener('focus', () => fetchNui('toggleInput', true, 'lb-tablet'));
            input.addEventListener('blur', () => fetchNui('toggleInput', false, 'lb-tablet'));
        });
    }

    refreshInputs(document.querySelectorAll('input, textarea'));

    const inputObserver = new MutationObserver((mutations) => {
        mutations.forEach((mutation) => {
            mutation.addedNodes.forEach((node) => {
                if (node.childNodes.length > 0) refreshInputs(node.querySelectorAll('input, textarea'));
                if (node.tagName === 'INPUT' || node.tagName === 'TEXTAREA') refreshInputs([node]);
            });
        });
    });

    inputObserver.observe(document.body, { childList: true, subtree: true });

    globalThis.postMessage('componentsLoaded', '*');
}

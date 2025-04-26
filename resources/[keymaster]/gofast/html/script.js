let uiConfig = {
  contact: {
    name: "Contact",
    icon: "fas fa-user-tie",
    status: "En ligne",
  },
  messages: {},
  options: {},
  animation: {
    showDelay: 500,
    typingSpeed: 50,
    messageDelay: 1000,
    optionsDelay: 500,
    transitionSpeed: 500,
    hostileDuration: 7000,
    angryMessageDelay: 1500,
    threatMessageDelay: 3500,
  },
};

let dialogMessages = {
  intro:
    "Hey, j'ai besoin de quelqu'un pour une mission rapide et bien payée. Ça t'intéresse?",
  interested:
    "Cool. J'ai besoin de faire déplacer un véhicule d'un point A à un point B. C'est du simple aller-retour.",
  rules:
    "Les règles sont simples : Conduis prudemment mais rapide, reste discret sur ce que tu transportes, si les flics t'arrêtent tu me connais pas, et une fois livré, tu es payé cash.",
  understand: "Alors, ça te va comme job?",
  waiting:
    "Parfait. Reste où tu es, le véhicule arrive dans quelques instants.",
  vehicle_coming: "Le voilà. Bonne route et fais gaffe à toi.",
  angry:
    "Tu te fous de ma gueule ? Tu crois que tu peux juste refuser comme ça après avoir tout entendu ?!",
  threat: "Tu vas voir ce qui arrive aux gens qui me font perdre mon temps...",
};

let dialogOptions = {
  intro: [
    { id: "interested", text: "Dis-m'en plus", icon: "fa-solid fa-ear-listen" },
    { id: "decline", text: "Pas intéressé", icon: "fa-solid fa-xmark" },
  ],
  interested: [
    { id: "continue", text: "Continue...", icon: "fa-solid fa-arrow-right" },
  ],
  rules: [
    { id: "understand", text: "Je comprends", icon: "fa-solid fa-check" },
    { id: "refuse", text: "C'est pas pour moi", icon: "fa-solid fa-xmark" },
  ],
  understand: [
    { id: "accept", text: "Je prends le job", icon: "fa-solid fa-handshake" },
    { id: "refuse", text: "Je passe mon tour", icon: "fa-solid fa-ban" },
  ],
};

let currentDialog = null;
let isTyping = false;

function showChat() {
  document.getElementById("chat-container").classList.add("visible");
}

function hideChat() {
  document.getElementById("chat-container").classList.remove("visible");
}

function addMessage(text, fromMe = false, showOptionsFlag = true) {
  const chatMessages = document.getElementById("chat-messages");
  const messageDiv = document.createElement("div");
  messageDiv.className = `message ${fromMe ? "from-me" : "from-them"}`;

  if (!fromMe) {
    showTypingIndicator();

    setTimeout(() => {
      removeTypingIndicator();
      messageDiv.textContent = text;
      chatMessages.appendChild(messageDiv);
      scrollToBottom();

      if (showOptionsFlag) {
        setTimeout(() => showDialogOptions(), uiConfig.animation.optionsDelay);
      } else {
        document.getElementById("chat-options").innerHTML = "";
        document.getElementById("chat-options").classList.remove("show");
      }
    }, text.length * uiConfig.animation.typingSpeed);
  } else {
    messageDiv.textContent = text;
    chatMessages.appendChild(messageDiv);
    scrollToBottom();
    animateCharacter(currentDialog, "player_typing");
  }
}

function showTypingIndicator() {
  if (isTyping) return;
  isTyping = true;

  const chatMessages = document.getElementById("chat-messages");
  const indicatorDiv = document.createElement("div");
  indicatorDiv.className = "message from-them";
  indicatorDiv.id = "typing-indicator";

  const indicator = document.createElement("div");
  indicator.className = "typing-indicator";

  for (let i = 0; i < 3; i++) {
    const dot = document.createElement("span");
    indicator.appendChild(dot);
  }

  indicatorDiv.appendChild(indicator);
  chatMessages.appendChild(indicatorDiv);
  scrollToBottom();

  animateCharacter(currentDialog, "contact_typing");
}

function removeTypingIndicator() {
  const indicator = document.getElementById("typing-indicator");
  if (indicator) {
    indicator.remove();
  }
  isTyping = false;
}

function scrollToBottom() {
  const chatMessages = document.getElementById("chat-messages");
  chatMessages.scrollTop = chatMessages.scrollHeight;
}

function showDialogOptions() {
  const optionsContainer = document.getElementById("chat-options");
  optionsContainer.innerHTML = "";

  if (!currentDialog || !dialogOptions[currentDialog]) {
    return;
  }

  dialogOptions[currentDialog].forEach((option) => {
    const button = document.createElement("div");
    button.className = "chat-option";

    if (option.icon) {
      const icon = document.createElement("i");
      icon.className = option.icon;
      button.appendChild(icon);
    }

    const text = document.createElement("span");
    text.textContent = option.text;
    button.appendChild(text);

    button.dataset.id = option.id;
    button.addEventListener("click", () => handleOptionClick(option.id));
    optionsContainer.appendChild(button);
  });

  setTimeout(() => {
    optionsContainer.classList.add("show");
  }, 300);
}

function handleOptionClick(optionId) {
  const optionsContainer = document.getElementById("chat-options");
  optionsContainer.classList.remove("show");

  let responseText = "...";
  if (currentDialog && dialogOptions[currentDialog]) {
    const option = dialogOptions[currentDialog].find(
      (opt) => opt.id === optionId
    );
    if (option) responseText = option.text;
  }

  addMessage(responseText, true);

  setTimeout(() => {
    optionsContainer.innerHTML = "";

    switch (optionId) {
      case "interested":
        currentDialog = "interested";
        setTimeout(
          () => addMessage(dialogMessages.interested),
          uiConfig.animation.messageDelay
        );
        break;

      case "decline":
        resetFocusCompletely();

        fetch(`https://${GetParentResourceName()}/closeMenu`, {
          method: "POST",
          body: JSON.stringify({}),
        });

        hideWithTransition();
        break;

      case "continue":
        currentDialog = "rules";
        setTimeout(
          () => addMessage(dialogMessages.rules),
          uiConfig.animation.messageDelay
        );
        break;

      case "understand":
        currentDialog = "understand";
        setTimeout(
          () => addMessage(dialogMessages.understand),
          uiConfig.animation.messageDelay
        );
        break;

      case "refuse":
        setTimeout(() => {
          addMessage(dialogMessages.angry, false, false);

          setTimeout(() => {
            addMessage(dialogMessages.threat, false, false);

            setTimeout(() => {
              resetFocusCompletely();

              setTimeout(() => {
                fetch(`https://${GetParentResourceName()}/npcHostile`, {
                  method: "POST",
                  headers: { "Content-Type": "application/json" },
                  body: JSON.stringify({}),
                }).catch((err) => console.error(err));
              }, 100);

              hideWithTransition();
            }, uiConfig.animation.hostileDuration);
          }, uiConfig.animation.threatMessageDelay);
        }, uiConfig.animation.angryMessageDelay);
        break;

      case "accept":
        currentDialog = "waiting";
        setTimeout(() => {
          addMessage(dialogMessages.waiting);

          setTimeout(() => {
            addMessage(dialogMessages.vehicle_coming);

            setTimeout(() => {
              fetch(`https://${GetParentResourceName()}/startGoFast`, {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({}),
              }).catch((err) => console.error(err));

              hideWithTransition();
            }, 3000);
          }, 4000);
        }, uiConfig.animation.messageDelay);
        break;
    }
  }, 500);
}

function hideWithTransition() {
  const container = document.getElementById("chat-container");
  container.style.opacity = "0";
  container.style.transform = "translate(-50%, 20px)";

  resetFocusCompletely();

  setTimeout(() => {
    hideChat();
    container.style.opacity = "";
    container.style.transform = "";
  }, uiConfig.animation.transitionSpeed);
}

function resetFocusCompletely() {
  fetch(`https://${GetParentResourceName()}/resetFocus`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({}),
  }).catch((err) => console.error(err));

  setTimeout(() => {
    fetch(`https://${GetParentResourceName()}/resetFocus`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({}),
    }).catch((err) => console.error(err));
  }, 100);
}

function animateCharacter(dialogState, action) {
  fetch(`https://${GetParentResourceName()}/animateCharacter`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ dialogState, action }),
  });
}

window.addEventListener("message", function (event) {
  console.log("Received event:", event.data.type, event.data);

  if (event.data.type === "showDialog") {
    if (event.data.config) {
      console.log("Applying config:", event.data.config);
      applyUIConfig(event.data.config);
    }

    document.getElementById("chat-messages").innerHTML = "";
    document.getElementById("chat-options").innerHTML = "";

    currentDialog = "intro";
    showChat();
    setTimeout(
      () => addMessage(dialogMessages.intro),
      uiConfig.animation.showDelay
    );
  } else if (event.data.type === "hideDialog") {
    hideChat();
  } else if (event.data.type === "updateAvatar") {
    if (event.data.avatar) {
      document.querySelector(".contact-avatar i").className = event.data.avatar;
    }
    if (event.data.name) {
      document.querySelector(".contact-name").textContent = event.data.name;
    }
  } else if (event.data.type === "updateConfig") {
    if (event.data.config) {
      applyUIConfig(event.data.config);
    }
  }
});

function applyUIConfig(config) {
  if (config.contact) {
    uiConfig.contact = config.contact;
    document.querySelector(".contact-name").textContent =
      config.contact.name || "Contact";
    document.querySelector(".contact-status").textContent =
      config.contact.status || "En ligne";

    if (config.contact.icon) {
      document.querySelector(".contact-avatar i").className =
        config.contact.icon;
    }

    const avatar = document.querySelector(".contact-avatar");
    if (config.contact.iconBgColor) {
      avatar.style.background = config.contact.iconBgColor;
    }

    if (
      config.contact.iconGradient &&
      config.contact.iconGradient.from &&
      config.contact.iconGradient.to
    ) {
      avatar.style.background = `linear-gradient(135deg, ${config.contact.iconGradient.from}, ${config.contact.iconGradient.to})`;
    }
  }

  if (config.messages) {
    dialogMessages = {
      intro: config.messages.intro || dialogMessages.intro,
      interested: config.messages.interested || dialogMessages.interested,
      rules: config.messages.rules || dialogMessages.rules,
      understand: config.messages.understand || dialogMessages.understand,
      waiting: config.messages.waiting || dialogMessages.waiting,
      vehicle_coming:
        config.messages.vehicleComing || dialogMessages.vehicle_coming,
      angry: config.messages.angry || dialogMessages.angry,
      threat: config.messages.threat || dialogMessages.threat,
    };
  }

  if (config.options) {
    const convertOptions = (options) => {
      if (!Array.isArray(options)) return [];

      return options.map((opt) => {
        return {
          id: opt && opt.Id ? String(opt.Id).toLowerCase() : "",
          text: opt && opt.Text ? opt.Text : "",
          icon: opt && opt.Icon ? opt.Icon : "",
        };
      });
    };

    dialogOptions = {
      intro: config.options.intro
        ? convertOptions(config.options.intro)
        : dialogOptions.intro,
      interested: config.options.interested
        ? convertOptions(config.options.interested)
        : dialogOptions.interested,
      rules: config.options.rules
        ? convertOptions(config.options.rules)
        : dialogOptions.rules,
      understand: config.options.understand
        ? convertOptions(config.options.understand)
        : dialogOptions.understand,
    };
  }

  if (config.animation) {
    uiConfig.animation = {
      showDelay: config.animation.showDelay ?? uiConfig.animation.showDelay,
      typingSpeed:
        config.animation.typingSpeed ?? uiConfig.animation.typingSpeed,
      messageDelay:
        config.animation.messageDelay ?? uiConfig.animation.messageDelay,
      optionsDelay:
        config.animation.optionsDelay ?? uiConfig.animation.optionsDelay,
      transitionSpeed:
        config.animation.transitionSpeed ?? uiConfig.animation.transitionSpeed,
      hostileDuration:
        config.animation.hostileDuration ?? uiConfig.animation.hostileDuration,
      angryMessageDelay:
        config.animation.angryMessageDelay ??
        uiConfig.animation.angryMessageDelay,
      threatMessageDelay:
        config.animation.threatMessageDelay ??
        uiConfig.animation.threatMessageDelay,
    };
  }

  if (config.appearance) {
    applyAppearanceConfig(config.appearance);
  }
}

function applyAppearanceConfig(appearance) {
  const container = document.getElementById("chat-container");
  const chatBox = document.querySelector(".chat-box");
  const chatHeader = document.querySelector(".chat-header");
  const chatMessages = document.querySelector(".chat-messages");

  if (appearance.width) container.style.width = appearance.width;
  if (appearance.maxWidth) container.style.maxWidth = appearance.maxWidth;
  if (appearance.minWidth) container.style.minWidth = appearance.minWidth;

  if (appearance.position) {
    if (appearance.position.bottom)
      container.style.bottom = appearance.position.bottom;
    if (appearance.position.center === false) {
      container.style.left = appearance.position.left || "10px";
      container.style.transform = "none";
    }
  }

  if (appearance.colors) {
    if (appearance.colors.background)
      chatBox.style.backgroundColor = appearance.colors.background;
    if (appearance.colors.headerBg)
      chatHeader.style.backgroundColor = appearance.colors.headerBg;
    if (appearance.colors.border)
      chatBox.style.borderColor = appearance.colors.border;

    const style = document.createElement("style");
    style.textContent = `
      .message.from-them { background-color: ${
        appearance.colors.theirMessage || "rgba(50, 50, 60, 0.7)"
      }; color: ${appearance.colors.theirText || "rgba(255, 255, 255, 0.9)"}; }
      .message.from-me { background-color: ${
        appearance.colors.myMessage || "rgba(62, 130, 247, 0.7)"
      }; color: ${appearance.colors.myText || "white"}; }
      .contact-name { color: ${appearance.colors.nameText || "white"}; }
      .contact-status { color: ${
        appearance.colors.statusText || "rgba(255, 255, 255, 0.7)"
      }; }
      .chat-option { background-color: ${
        appearance.colors.optionBg || "rgba(255, 255, 255, 0.12)"
      }; color: ${appearance.colors.optionText || "rgba(255, 255, 255, 0.9)"}; }
      .chat-option:hover { background-color: ${
        appearance.colors.optionHoverBg || "rgba(62, 130, 247, 0.5)"
      }; }
    `;
    document.head.appendChild(style);
  }

  if (appearance.blur) {
    if (appearance.blur.enable === false) {
      chatBox.style.backdropFilter = "none";
    } else if (appearance.blur.amount) {
      chatBox.style.backdropFilter = `blur(${appearance.blur.amount})`;
    }
  }

  if (appearance.borderRadius) {
    if (appearance.borderRadius.container)
      chatBox.style.borderRadius = appearance.borderRadius.container;

    const style = document.createElement("style");
    style.textContent = `
      .message { border-radius: ${appearance.borderRadius.message || "16px"}; }
      .chat-option { border-radius: ${
        appearance.borderRadius.option || "18px"
      }; }
    `;
    document.head.appendChild(style);
  }

  if (appearance.shadow) {
    chatBox.style.boxShadow = appearance.shadow;
  }

  if (appearance.font) {
    if (appearance.font.family) {
      document.body.style.fontFamily = appearance.font.family;
    }

    const style = document.createElement("style");
    style.textContent = `
      .contact-name { font-size: ${appearance.font.sizeName || "14px"}; }
      .contact-status { font-size: ${appearance.font.sizeStatus || "11px"}; }
      .message { font-size: ${appearance.font.sizeMessage || "13px"}; }
      .chat-option { font-size: ${appearance.font.sizeOption || "13px"}; }
    `;
    document.head.appendChild(style);
  }
}

document.addEventListener("keydown", function (event) {
  if (
    event.key === "Escape" &&
    document.getElementById("chat-container").classList.contains("visible")
  ) {
    resetFocusCompletely();

    fetch(`https://${GetParentResourceName()}/closeMenu`, {
      method: "POST",
      body: JSON.stringify({}),
    });

    hideWithTransition();

    event.preventDefault();
  }
});

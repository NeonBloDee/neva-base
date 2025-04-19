const deathscreen_container = document.getElementById("deathscreen_container");

let deathscreen_open = false;
let deathscreen_time = 360;
let deathscreen_timer_interval = null;
let deathscreen_call = false;

let spamNB = 0;
let showingDeathInfo = false;

let Config = {
  DefaultRespawnTime: 360,
  NotificationDuration: 5000,
  Controls: {
    CallMedic: "E",
    Respawn: "X",
    Info: "I",
    Report: "R",
  },
  DefaultMessages: {
    MedicCalled: "Les secours ont été contactés. Veuillez patienter.",
    MedicEnRoute: "Les secours sont actuellement en route !",
    TimerNotFinished: "Vous devez attendre la fin du timer avant de respawn.",
    ReportSent: "Votre signalement a été envoyé au Staff.",
  },
};

let ConfigUI = {};

let deathInfo = {
  reason: "Inconnue",
  killerId: "Aucun",
};

const notificationContainer = document.createElement("div");
notificationContainer.className = "notification-container";
document.body.appendChild(notificationContainer);

addEventListener("message", function (e) {
  const data = e.data;

  switch (data.type) {
    case "update:config":
      Config = data.config || Config;
      ConfigUI = data.configUI || ConfigUI;
      applyUIConfig();
      break;

    case "deathscreen:open":
      deathscreen_call = false;
      spamNB = 0;
      deathscreen_show();
      break;

    case "deathscreen:close":
      deathscreen_hide();
      document.getElementById("deathscreen_emsAreIncoming").style.display =
        "none";
      break;

    case "medicUnit:show":
      document.getElementById("deathscreen_emsAreIncoming").style.display =
        "block";
      break;

    case "medicUnit:hide":
      document.getElementById("deathscreen_emsAreIncoming").style.display =
        "none";
      break;

    case "notified":
      const text = document.getElementById("deathscreen_emsAreIncoming");
      text.innerHTML =
        '<span class="green">Les secours</span> sont actuellement en route !';
      break;

    case "death:info":
      document.getElementById("death-reason").textContent = data.reason;
      document.getElementById("killer-id").textContent =
        data.killerId !== "Aucun" ? `ID: ${data.killerId}` : "Aucun";

      deathInfo.reason = data.reason;
      deathInfo.killerId = data.killerId;
      break;

    case "update:timer":
      if (data.time !== undefined) {
        deathscreen_time = data.time * 60;
      }
      break;

    default:
      break;
  }
});

addEventListener("keydown", function (e) {
  if (!deathscreen_open) return;

  console.log("Touche pressée:", e.key, e.keyCode);

  if (e.key === "i" || e.key === "I" || e.keyCode === 73) {
    showInfoPopup();
  } else if (e.key === "r" || e.key === "R" || e.keyCode === 82) {
    showFreekillPopup();
  } else if (e.key === "Escape" || e.keyCode === 27) {
    closePopup("info_popup");
    closePopup("freekill_popup");
  } else if (e.key === "e" || e.key === "E" || e.keyCode === 69) {
    deathscreen_call_button("call");
  } else if (e.key === "x" || e.key === "X" || e.keyCode === 88) {
    deathscreen_call_button("respawn");
  }
});

window.SendLUAMessage = (name, data = {}) => {
  const resourceName = GetParentResourceName();

  fetch(`https://${resourceName}/${name}`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(data),
  }).catch((error) => {
    return;
  });
};

deathscreen_show = () => {
  if (deathscreen_open) return;

  deathscreen_time = Config.DefaultRespawnTime || 360;
  document.getElementById("deathscreen_call").classList.remove("disabled");
  deathscreen_open = true;
  deathscreen_container.classList.remove("hide");
  deathscreen_timer();
};

deathscreen_hide = () => {
  if (!deathscreen_open) return;

  deathscreen_open = false;

  if (showingDeathInfo) {
    document.getElementById("death_info_panel").classList.remove("visible");
    document.getElementById("death_info_overlay").classList.remove("visible");
  }

  setTimeout(() => {
    deathscreen_container.classList.add("hide");
    document.getElementById("death_info_panel").style.display = "none";
    document.getElementById("death_info_overlay").style.display = "none";
    document.getElementById("deathscreen_deathInfo").style.display = "none";
  }, 300);

  clearInterval(deathscreen_timer_interval);
};

deathscreen_timer = () => {
  const timerMinutesTens = document.getElementById("deathscreen_minutes_tens");
  const timerMinutesUnits = document.getElementById(
    "deathscreen_minutes_units"
  );
  const timerSecondsTens = document.getElementById("deathscreen_seconds_tens");
  const timerSecondsUnits = document.getElementById(
    "deathscreen_seconds_units"
  );

  let previousTime = { minutes: 0, seconds: 0 };

  deathscreen_timer_interval = setInterval(() => {
    if (deathscreen_time <= 0) {
      clearInterval(deathscreen_timer_interval);
      return;
    }

    deathscreen_time--;

    const minutes = Math.floor(deathscreen_time / 60);
    const seconds = deathscreen_time % 60;

    const updateElement = (element, newValue, previousValue) => {
      if (newValue !== previousValue) {
        element.classList.remove("animate-in", "animate-out");
        element.classList.add("animate-out");

        setTimeout(() => {
          element.innerText = newValue;
          element.classList.remove("animate-out");
          element.classList.add("animate-in");
        }, 300);
      }
    };

    updateElement(
      timerMinutesTens,
      Math.floor(minutes / 10),
      Math.floor(previousTime.minutes / 10)
    );
    updateElement(timerMinutesUnits, minutes % 10, previousTime.minutes % 10);
    updateElement(
      timerSecondsTens,
      Math.floor(seconds / 10),
      Math.floor(previousTime.seconds / 10)
    );
    updateElement(timerSecondsUnits, seconds % 10, previousTime.seconds % 10);

    previousTime.minutes = minutes;
    previousTime.seconds = seconds;
  }, 1000);
};

function showNotification(message) {
  const notification = document.createElement("div");
  notification.className = "deathscreen-notification";
  notification.textContent = message;

  notificationContainer.appendChild(notification);

  setTimeout(() => {
    notification.classList.add("show");
  }, 10);

  setTimeout(() => {
    notification.classList.remove("show");
    setTimeout(() => {
      notificationContainer.removeChild(notification);
    }, 300);
  }, Config.NotificationDuration || 5000);
}

function deathscreen_call_button(type) {
  if (!deathscreen_open) return;

  if (type === "call") {
    if (deathscreen_call) return;

    deathscreen_call = true;

    const callButton = document.getElementById("deathscreen_call");
    if (callButton) callButton.classList.add("disabled");

    showNotification(
      Config.DefaultMessages.MedicCalled ||
        "Les secours ont été contactés. Veuillez patienter."
    );

    window.SendLUAMessage("deathscreen:call");
  } else if (type === "respawn") {
    if (deathscreen_time > 0) {
      showNotification(
        Config.DefaultMessages.TimerNotFinished ||
          "Vous devez attendre la fin du timer avant de respawn."
      );
      return;
    }

    window.SendLUAMessage("deathscreen:end");
    window.SendLUAMessage("deathscreen:respawn");
  }
}

function showInfoPopup() {
  if (!deathscreen_open) return;

  console.log("Affichage popup info");

  document.getElementById("freekill_popup").style.display = "none";
  document.getElementById("freekill_popup").classList.remove("visible");
  document.getElementById("freekill_popup").classList.remove("closing");

  const infoPopup = document.getElementById("info_popup");
  infoPopup.style.display = "block";
  infoPopup.classList.add("visible");
  showingDeathInfo = true;
}

function showFreekillPopup() {
  if (!deathscreen_open) return;

  console.log("Affichage popup freekill");

  document.getElementById("info_popup").style.display = "none";
  document.getElementById("info_popup").classList.remove("visible");
  document.getElementById("info_popup").classList.remove("closing");

  const freekillPopup = document.getElementById("freekill_popup");
  freekillPopup.style.display = "block";
  freekillPopup.classList.add("visible");
}

function closePopup(id) {
  console.log("Fermeture popup:", id);
  const popup = document.getElementById(id);

  if (popup) {
    // Add closing animation class
    popup.classList.remove("visible");
    popup.classList.add("closing");

    if (id === "info_popup") {
      showingDeathInfo = false;
    }

    setTimeout(() => {
      popup.style.display = "none";
      popup.classList.remove("closing");
    }, 300);
  }
}

function confirmFreekill() {
  let reportMessage = "";

  if (Config.Report && Config.Report.AutoFormat) {
    reportMessage = Config.Report.AutoFormat.replace(
      "%s",
      deathInfo.reason
    ).replace("%s", deathInfo.killerId);
  } else {
    reportMessage = `[Auto] J'ai été freekill, raison: ${deathInfo.reason}, ID du tueur: ${deathInfo.killerId}`;
  }

  window.SendLUAMessage("deathscreen:report", { message: reportMessage });
  closePopup("freekill_popup");
  showNotification(
    Config.DefaultMessages.ReportSent ||
      "Votre signalement a été envoyé au Staff."
  );
}

function applyUIConfig() {
  if (!ConfigUI) return;

  console.log("Applying UI configuration");

  if (ConfigUI.Texts) {
    const titleElement = document.querySelector(".deathscreen-text");
    const descElement = document.querySelector(".deatnscreen-desc");

    if (titleElement) titleElement.textContent = ConfigUI.Texts.Title;
    if (descElement) descElement.textContent = ConfigUI.Texts.Description;

    const callText = document.querySelector(
      "#deathscreen_call .deathscreen-action-text"
    );
    if (callText) callText.textContent = ConfigUI.Texts.CallMedic;

    const respawnText = document.querySelector(
      "#deathscreen_respawn .deathscreen-action-text"
    );
    if (respawnText) respawnText.textContent = ConfigUI.Texts.Respawn;

    const infoText = document.querySelector(
      "#deathscreen_info .deathscreen-action-text"
    );
    if (infoText) infoText.textContent = ConfigUI.Texts.Information;

    const reportText = document.querySelector(
      "#deathscreen_report .deathscreen-action-text"
    );
    if (reportText) reportText.textContent = ConfigUI.Texts.ReportFreekill;

    const infoHeader = document.querySelector("#info_popup .popup-header");
    if (infoHeader) infoHeader.textContent = ConfigUI.Texts.InfoPopupTitle;

    const freekillHeader = document.querySelector(
      "#freekill_popup .popup-header"
    );
    if (freekillHeader)
      freekillHeader.textContent = ConfigUI.Texts.FreekillPopupTitle;

    const freekillContent = document.querySelector(
      "#freekill_popup .popup-content"
    );
    if (freekillContent)
      freekillContent.textContent = ConfigUI.Texts.FreekillPopupContent;
  }

  if (Config.Controls) {
    const callKey = document.querySelector(
      "#deathscreen_call .deathscreen-action-letter"
    );
    if (callKey) callKey.textContent = Config.Controls.CallMedic;

    const respawnKey = document.querySelector(
      "#deathscreen_respawn .deathscreen-action-letter"
    );
    if (respawnKey) respawnKey.textContent = Config.Controls.Respawn;

    const infoKey = document.querySelector(
      "#deathscreen_info .deathscreen-action-letter"
    );
    if (infoKey) infoKey.textContent = Config.Controls.Info;

    const reportKey = document.querySelector(
      "#deathscreen_report .deathscreen-action-letter"
    );
    if (reportKey) reportKey.textContent = Config.Controls.Report;
  }

  const dynamicStyles = generateDynamicStyles();
  const styleElement = document.getElementById("dynamic-styles");
  if (styleElement) styleElement.innerHTML = dynamicStyles;

  toggleVisualElements();
}

function generateDynamicStyles() {
  if (!ConfigUI) return "";

  let styles = "";

  if (ConfigUI.RedGradient) {
    const inner = ConfigUI.RedGradient.InnerRGB;
    const outer = ConfigUI.RedGradient.OuterRGB;

    styles += `
      .deathscreen-red-gradient {
        background: radial-gradient(
          circle at center,
          rgba(${inner[0]}, ${inner[1]}, ${inner[2]}, ${ConfigUI.RedGradient.CenterOpacity}) 0%,
          rgba(${inner[0]}, ${inner[1]}, ${inner[2]}, ${ConfigUI.RedGradient.CenterOpacity}) 40%,
          rgba(${outer[0]}, ${outer[1]}, ${outer[2]}, ${ConfigUI.RedGradient.EdgeOpacity}) 80%,
          rgba(${outer[0]}, ${outer[1]}, ${outer[2]}, ${ConfigUI.RedGradient.EdgeOpacity}) 100%
        );
      }
    `;
  }

  if (ConfigUI.Background) {
    const bg = ConfigUI.Background;
    styles += `
      .deathscreen-bg-fade {
        background: rgba(${bg.RGB[0]}, ${bg.RGB[1]}, ${bg.RGB[2]}, ${bg.Opacity});
      }
    `;
  }

  return styles;
}

function toggleVisualElements() {
  if (!ConfigUI) return;

  const redGradient = document.querySelector(".deathscreen-red-gradient");
  const bgFade = document.querySelector(".deathscreen-bg-fade");

  if (redGradient) {
    redGradient.style.display = ConfigUI.EnableRedGradient ? "block" : "none";
  }

  if (bgFade) {
    bgFade.style.display = ConfigUI.EnableBackgroundFade ? "block" : "none";
  }
}

window.showInfoPopup = showInfoPopup;
window.showFreekillPopup = showFreekillPopup;
window.closePopup = closePopup;
window.confirmFreekill = confirmFreekill;

document.addEventListener("DOMContentLoaded", function () {
  const infoButton = document.getElementById("deathscreen_info");
  if (infoButton) infoButton.onclick = showInfoPopup;

  const reportButton = document.getElementById("deathscreen_report");
  if (reportButton) reportButton.onclick = showFreekillPopup;

  const callButton = document.getElementById("deathscreen_call");
  if (callButton) callButton.onclick = () => deathscreen_call_button("call");

  const respawnButton = document.getElementById("deathscreen_respawn");
  if (respawnButton)
    respawnButton.onclick = () => deathscreen_call_button("respawn");

  console.log("Death screen initialized");
});

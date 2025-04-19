let hudConfig = {
  position: { bottom: "1.25%", left: "16%" },
  colors: {
    thirst: "rgba(91, 173, 220, 0.85)",
    hunger: "rgba(242, 162, 101, 0.85)",
    voice: {
      default: "rgba(255, 255, 255, 0.95)",
      whisper: "rgba(91, 173, 220, 0.95)",
      normal: "rgba(255, 255, 255, 0.95)",
      shout: "rgba(255, 99, 71, 0.95)",
    },
    icons: {
      thirst: "rgba(150, 210, 255, 0.95)",
      hunger: "rgba(255, 200, 150, 0.95)",
      voice: "rgba(255, 255, 255, 0.95)",
    },
    background: "rgba(10, 10, 10, 0.35)",
  },
  animations: {
    fadeInTime: 80,
    fadeOutTime: 80,
  },
  circle: {
    strokeWidth: "0.32vw",
    radius: "42",
  },
  voiceTypes: {
    regular: "microphone",
    radio: "tower-broadcast",
    phone: "phone",
  },
};

const voiceElement = document.getElementById("voice");
let voiceTimeout = null;
let isResourceValid = false;

function checkResourceName() {
  fetch("https://hud/checkResourceName", {
    method: "POST",
    headers: {
      "Content-Type": "application/json; charset=UTF-8",
    },
    body: JSON.stringify({}),
  })
    .then((resp) => {
      isResourceValid = true;
      console.log("Resource validation successful");
    })
    .catch((error) => {
      console.error(
        "Invalid resource name! This UI only works with resource name 'hud'"
      );
      document.body.innerHTML =
        "<div style='color:white; background:rgba(0,0,0,0.8); padding:20px; position:fixed; top:50%; left:50%; transform:translate(-50%,-50%); font-family:sans-serif; border-radius:5px; text-align:center;'><h2>HUD Error</h2><p>The resource must be named exactly 'hud' to function properly.</p><p>Please rename the resource folder.</p></div>";
    });
}

function applyConfig() {
  if (!isResourceValid) return;

  $("#status").css({
    bottom: hudConfig.position.bottom,
    left: hudConfig.position.left,
  });

  $(".status-circle").css({
    "stroke-width": hudConfig.circle.strokeWidth,
    fill: hudConfig.colors.background,
  });

  const Colors = JSON.parse(localStorage.getItem("hud_colors")) || {};

  if (!Colors.thirst)
    $("#thirst circle").css("stroke", hudConfig.colors.thirst);
  if (!Colors.hunger)
    $("#hunger circle").css("stroke", hudConfig.colors.hunger);
  if (!Colors.voice)
    $("#voice circle").css("stroke", hudConfig.colors.voice.default);

  $("#thirst .icon-container i").css("color", hudConfig.colors.icons.thirst);
  $("#hunger .icon-container i").css("color", hudConfig.colors.icons.hunger);
  $("#voice .icon-container i").css("color", hudConfig.colors.icons.voice);

  document.documentElement.style.setProperty(
    "--fade-in-time",
    hudConfig.animations.fadeInTime + "ms"
  );
  document.documentElement.style.setProperty(
    "--fade-out-time",
    hudConfig.animations.fadeOutTime + "ms"
  );
}

setProgress = (element, percent) => {
  const Circumference = element.prop("r").baseVal.value * 2 * Math.PI;
  const Offset = Circumference - (percent / 100) * Circumference;

  element.css({
    strokeDasharray: `${Circumference} ${Circumference}`,
    strokeDashoffset: Offset,
  });

  const previousValue = element.data("previousValue") || 100;
  if (Math.abs(previousValue - percent) > 10) {
    element.parent().parent().addClass("pulse");
    setTimeout(() => {
      element.parent().parent().removeClass("pulse");
    }, 400);
  }
  element.data("previousValue", percent);
};

onload = () => {
  checkResourceName();

  const Colors = JSON.parse(localStorage.getItem("hud_colors"));
  let defaultColors = {
    thirst: "rgba(91, 173, 220, 0.85)",
    hunger: "rgba(242, 162, 101, 0.85)",
    voice: "rgba(255, 255, 255, 0.85)",
  };

  if (!Colors) {
    localStorage.setItem("hud_colors", JSON.stringify(defaultColors));
  }

  $.each(defaultColors, (key, value) => {
    const circle = $(`#${key} circle`);
    if (circle.length) {
      setProgress(circle, 100);
      if (!Colors || !Colors[key]) {
        circle.css("stroke", value);
      }
    }
  });

  $.each(defaultColors, (key, value) => {
    if (!Colors || !Colors[key]) {
      $(`#${key} circle`).css("stroke", value);
    }
  });

  addEventListener("message", (event) => {
    if (!isResourceValid && event.data.action !== "initConfig") return;

    switch (event.data.action) {
      case "initConfig":
        hudConfig = event.data.config;
        console.log("Received voice types:", hudConfig.voiceTypes);
        isResourceValid = true;
        applyConfig();
        break;
      case "update":
        $.each(event.data.data, (key, value) => {
          const K = $(`#${key} circle`);
          if (K.length) {
            setProgress(K, value);
          }
        });
        break;
      case "panel":
        $("#panel").toggle();
        break;
      case "voiceUpdate":
        $("#voice").removeClass("voice-whisper voice-normal voice-shout");
        $("#voice").addClass("voice-" + event.data.range);

        setVoiceIcon(event.data.voiceType);

        setProgress($("#voice circle"), event.data.percent);

        if (event.data.voiceType === "radio") {
          const radioRange = "radio" + capitalizeFirstLetter(event.data.range);
          const radioColor =
            hudConfig.colors.voice[radioRange] || hudConfig.colors.voice.radio;
          $("#voice circle").css("stroke", radioColor);

          const radioIconColor =
            hudConfig.colors.icons[radioRange] || hudConfig.colors.icons.radio;
          $("#voice .icon-container i").css("color", radioIconColor);
        } else if (
          event.data.voiceType === "phone" &&
          hudConfig.colors.voice.phone
        ) {
          $("#voice circle").css("stroke", hudConfig.colors.voice.phone);
        }

        if (event.data.talking) {
          $("#voice").addClass("voice-active").show();
        } else {
          $("#voice").removeClass("voice-active");
          if (!$("#voice").hasClass("ptt-active")) {
            $("#voice").hide();
          }
        }
        break;
      case "pttState":
        if (event.data.active) {
          if (voiceTimeout) {
            clearTimeout(voiceTimeout);
            voiceTimeout = null;
          }

          voiceElement.style.display = "block";
          voiceElement.classList.remove("hide-voice");
          voiceElement.classList.add("show-voice");

          setVoiceIcon(event.data.voiceType);

          requestAnimationFrame(() => {
            $("#voice")
              .removeClass("voice-whisper voice-normal voice-shout")
              .addClass("voice-" + event.data.range);

            if (event.data.voiceType === "radio") {
              const radioRange =
                "radio" + capitalizeFirstLetter(event.data.range);
              const radioColor =
                hudConfig.colors.voice[radioRange] ||
                hudConfig.colors.voice.radio;
              $("#voice circle").css("stroke", radioColor);

              const radioIconColor =
                hudConfig.colors.icons[radioRange] ||
                hudConfig.colors.icons.radio;
              $("#voice .icon-container i").css("color", radioIconColor);
            } else if (
              event.data.voiceType === "phone" &&
              hudConfig.colors.voice.phone
            ) {
              $("#voice circle").css("stroke", hudConfig.colors.voice.phone);
            } else {
              const voiceColor = hudConfig.colors.voice[event.data.range];
              if (voiceColor) {
                $("#voice circle").css("stroke", voiceColor);
              }
            }

            setProgress($("#voice circle"), event.data.percent);
          });
        } else {
          voiceElement.classList.remove("show-voice");
          voiceElement.classList.add("hide-voice");

          voiceTimeout = setTimeout(() => {
            voiceElement.style.display = "none";
            voiceTimeout = null;
          }, hudConfig.animations.fadeOutTime + 5);
        }
        break;
      case "inCar":
        $("#status").css({
          bottom: "1.25%",
          left: "16%",
        });
        break;
      case "toggleVisibility":
        if (event.data.visible) {
          $("#status").fadeIn(400);
        } else {
          $("#status").fadeOut(400);
        }
        break;
    }
  });

  {
    const Colors = JSON.parse(localStorage.getItem("hud_colors"));

    if (Colors) {
      $.each(Colors, (key, value) => {
        $(`#${key} circle`).css("stroke", value);
      });
    }
  }
};

function setVoiceIcon(voiceType) {
  const type = voiceType || "regular";

  console.log("Setting voice icon to: " + type);

  let iconName = "microphone";

  if (hudConfig.voiceTypes && hudConfig.voiceTypes[type]) {
    iconName = hudConfig.voiceTypes[type];
  }

  const iconElement = $("#voice .icon-container i");
  iconElement.attr("class", "fas fa-" + iconName);

  $("#voice").removeClass(
    "voice-type-regular voice-type-radio voice-type-phone"
  );
  $("#voice").addClass("voice-type-" + type);

  let iconColor = hudConfig.colors.icons.voice;

  if (hudConfig.colors.icons[type]) {
    iconColor = hudConfig.colors.icons[type];
  }

  iconElement.css("color", iconColor);

  return true;
}

function capitalizeFirstLetter(string) {
  return string.charAt(0).toUpperCase() + string.slice(1);
}

let colorPicker = new iro.ColorPicker("#picker", {
  borderWidth: 1,
  borderColor: "#7B68EE",
  layoutDirection: "horizontal",
  layout: [
    {
      component: iro.ui.Box,
    },
    {
      component: iro.ui.Slider,
      options: {
        sliderType: "hue",
      },
    },
  ],
});

colorPicker.on("color:change", (color) => {
  const Hex = color.hexString;
  const Selected = $("input[name=color]:checked").val();

  if (Selected.length) {
    $(`#${Selected} circle`).css("stroke", Hex);

    const Colors = JSON.parse(localStorage.getItem("hud_colors"));
    let table = Colors ? Colors : JSON.parse("{}");
    table[Selected] = Hex;
    localStorage.setItem("hud_colors", JSON.stringify(table));
  }
});

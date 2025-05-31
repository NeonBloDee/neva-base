let vehicles = [];
let weapons = [];
let money = [];
let tebex = [];
let cases = [];

let coins = 0;
let storeCode = 0;
let currentElement = null;
let gameView = null;

// Function to initialize GameView with utk_render
function initializeGameView() {
  console.log("🎮 Initializing GameView with utk_render...");

  try {
    const canvas = document.getElementById("backgroundCanvas");
    if (!canvas) {
      console.error("❌ Background canvas not found!");
      return false;
    }

    console.log("🎮 Showing canvas and starting GameView...");
    canvas.style.display = "block";

    // Get menuBox dimensions for optimal sizing
    const menuBox = document.getElementById("menuBox");
    let canvasWidth = window.innerWidth;
    let canvasHeight = window.innerHeight;

    if (menuBox) {
      const menuBoxRect = menuBox.getBoundingClientRect();
      console.log("📏 MenuBox dimensions:", {
        width: menuBoxRect.width,
        height: menuBoxRect.height,
        x: menuBoxRect.x,
        y: menuBoxRect.y,
      });

      // Use menuBox area for more efficient rendering
      // Add some padding for blur effects
      const padding = 50;
      canvasWidth = Math.max(
        menuBoxRect.width + padding * 2,
        window.innerWidth
      );
      canvasHeight = Math.max(
        menuBoxRect.height + padding * 2,
        window.innerHeight
      );

      // Position canvas to cover the menuBox area optimally
      canvas.style.left = Math.max(0, menuBoxRect.x - padding) + "px";
      canvas.style.top = Math.max(0, menuBoxRect.y - padding) + "px";
      canvas.style.width = canvasWidth + "px";
      canvas.style.height = canvasHeight + "px";

      console.log("📍 Canvas positioned at:", {
        left: canvas.style.left,
        top: canvas.style.top,
        width: canvas.style.width,
        height: canvas.style.height,
      });
    }

    // Set canvas dimensions
    canvas.width = canvasWidth;
    canvas.height = canvasHeight;
    console.log("📏 Canvas dimensions set to:", canvasWidth, "x", canvasHeight);

    // Create GameView instance if available
    if (window.GameView) {
      try {
        console.log("🚀 Creating GameView instance...");
        gameView = new window.GameView(canvas);
        console.log("✅ GameView instance created successfully");
      } catch (error) {
        console.error("❌ Failed to create GameView instance:", error);
      }
    } else {
      console.warn(
        "⚠️ GameView class not available, using utk_render directly"
      );
    }

    // Initialize utk_render for backdrop-filter support
    if (typeof startRenderLoop === "function") {
      console.log("🎬 Starting utk_render loop...");
      startRenderLoop();
    } else {
      console.warn("⚠️ utk_render startRenderLoop not available");
    }

    console.log("✅ GameView initialization completed");
    return true;
  } catch (error) {
    console.error("❌ Failed to initialize GameView:", error);
    return false;
  }
}

// Function to destroy GameView and utk_render
function destroyGameView() {
  console.log("🗑️ Destroying GameView and utk_render...");

  // Stop utk_render first
  if (typeof stopRenderLoop === "function") {
    console.log("⏹️ Stopping utk_render loop...");
    stopRenderLoop();
  }

  // Destroy GameView instance
  if (gameView) {
    try {
      if (gameView.stop) gameView.stop();
      if (gameView.destroy) gameView.destroy();
    } catch (error) {
      console.error("❌ Error during GameView cleanup:", error);
    }
    gameView = null;
  }

  // Hide and reset canvas
  const canvas = document.querySelector("#backgroundCanvas");
  if (canvas) {
    canvas.style.display = "none";
    // Reset canvas position and size
    canvas.style.left = "0";
    canvas.style.top = "0";
    canvas.style.width = "100vw";
    canvas.style.height = "100vh";
    console.log("🖼️ Canvas hidden and reset");
  }

  console.log("✅ GameView and utk_render destroyed");
}

function parseMessage(message) {
  const regexColor = /~([^h])~([^~]+)/g;
  const regexBold = /~([h])~([^~]+)/g;
  const regexStop = /~s~/g;
  const regexLine = /\n/g;
  message = message
    .replace(regexColor, "<span class='$1'>$2</span>")
    .replace(regexBold, "<span class='$1'>$2</span>")
    .replace(regexStop, "")
    .replace(regexLine, "<br />");
  return message;
}

function notify(label) {
  document.getElementById("notify").innerHTML = parseMessage(label);
  $("#notify").show(500);
  setTimeout(() => {
    $("#notify").hide(500);
  }, 4500);
}

function post(name, data) {
  $.post(`https://${GetParentResourceName()}/${name}`, JSON.stringify(data));
}

function closeAll() {
  console.log("📁 Closing menu - UI first, then GameView...");

  // First hide the UI with animation
  $("#menuBox").fadeOut(500, function () {
    // UI is now hidden, safe to destroy GameView
    console.log("✅ UI hidden, now destroying GameView...");
    destroyGameView();
  });

  post("boutique:hide");
}

function refreshStats() {
  document.getElementById("storeCode").textContent = storeCode;
  document.getElementById("storeCoins").textContent = coins;
}

$("#vehicleBoxCat").click(() => {
  $("#homePage").hide(500);
  $("#VehiclesCatMenu").show(500);
});

$("#closeVehiclesCatMenu").click(() => {
  $("#VehiclesCatMenu").hide(500);
  $("#homePage").show(500);
});

$("#weaponBoxCat").click(() => {
  $("#homePage").hide(500);
  $("#WeaponsCatMenu").show(500);
});

$("#moneyBoxCat").click(() => {
  $("#homePage").hide(500);
  $("#MoneyCatMenu").show(500);
});

$("#manageBoxCat").click(() => {
  $("#manageMenuCat").show(500);
});

$("#closeWeaponsCatMenu").click(() => {
  $("#WeaponsCatMenu").hide(500);
  $("#homePage").show(500);
});

$("#closeMoneyCatMenu").click(() => {
  $("#MoneyCatMenu").hide(500);
  $("#homePage").show(500);
});

$("#casezBoxCat").click(() => {
  $("#homePage").hide(500);
  $("#CaseCatMenu").show(500);
});

$("#closeCaseCatMenu").click(() => {
  $("#CaseCatMenu").hide(500);
  $("#homePage").show(500);
});

$("#closeCasesCatMenu").click(() => {
  $("#CasesCatMenu").hide(500);
});

$("#closeManage").click(() => {
  $("#manageMenuCat").hide(500);
});

$("#productConfirmationCancelButton").click(() => {
  currentElement = null;
  $("#productConfirmationPage").hide(500);
});

$("#productConfirmationBuyButton").click(() => {
  if (currentElement) {
    currentElement();
  }

  $("#productConfirmationPage").hide(500);
});

$("#productConfirmationCancelButton2").click(() => {
  if (currentElement) {
    currentElement(true);
  }

  $("#productConfirmationPage2").hide(500);
});

$("#productConfirmationBuyButton2").click(() => {
  if (currentElement) {
    currentElement(false);
  }
  $("#productConfirmationPage2").hide(500);
});

function testVehicle(index) {
  const element = vehicles[index];
  post("boutique:testVehicle", element);
}

function buyVehicle(index) {
  $("#productConfirmationPage").show(500);

  currentElement = function () {
    const element = vehicles[index];
    post("boutique:buyVehicle", element);
  };
}

function buyWeapon(index) {
  $("#productConfirmationPage").show(500);

  currentElement = function () {
    const element = weapons[index];
    post("boutique:buyWeapon", element);
  };
}

function buyMoney(index) {
  $("#productConfirmationPage").show(500);

  currentElement = function () {
    const element = money[index];
    post("boutique:buyMoney", element);
  };
}

function closeCasePrizeList2() {
  $("#caseOpeningPage").hide(500);
}

function viewCase(index) {
  $("#CasesCatViewMenu").hide(500);
  $("#caseOpeningPage").show(500);
  const element = cases[index];

  document.getElementById("caseGains").innerHTML = "";
  document.getElementById(
    "caseGains2"
  ).innerHTML = `<div class="exitBox" onclick="closeCasePrizeList2()"><i class="fa-solid fa-xmark"></i></div>`;

  for (let gain of element.gains) {
    $("#caseGains2").append(`
            <div class="casePrize">
                <h3 class="casePrizeName">
                    ${gain.label}
                    <p>${gain.typeLabel}</p>
                </h3>
                <img src="./img/${gain.img}.png" alt="" class="casePrizeImg" />
            </div>
        `);
  }
}

function random(min, max) {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

function tirerGain(element) {
  let totalChance = element.gains.reduce((sum, gain) => sum + gain.chance, 0);
  let tirage = random(0, totalChance);
  // console.log('Total Chance:', totalChance);
  // console.log('Tirage:', tirage);
  let cumul = 0;

  for (let [_i, gain] of element.gains.entries()) {
    cumul += gain.chance;
    // console.log(`Cumul pour ${gain.label}: ${cumul}`);
    if (tirage <= cumul) {
      // console.log('Gain sélectionné:', gain.label);
      return _i;
    }
  }
  return null;
}

function buyCase(index) {
  $("#productConfirmationPage").show(500);
  currentElement = function () {
    const element = cases[index];

    $("#CasesCatViewMenu").hide(500);

    if (coins >= element.coins) {
      post("boutique:buyCase", {
        caseLabel: element.label,
        caseCoins: element.coins,
      });

      $("#caseOpeningPage").show(500);

      document.getElementById("caseGains").innerHTML = "";
      document.getElementById("caseGains2").innerHTML = "";

      for (let i = 0; i < 210; i++) {
        let gain;
        let index;

        if (i === 27) {
          index = tirerGain(element);
          gain = index !== null ? element.gains[index] : null;
        } else {
          index = tirerGain(element);
          gain = element.gains[index];
        }

        if (gain) {
          $("#caseGains").append(`
                    <div class="casePrize" id="itemNumber${i}" data-rarity="${index}">
                        <h3 class="casePrizeName">
                            ${gain.label}
                            <p>${gain.typeLabel}</p>
                        </h3>
                        <img src="./img/${gain.img}.png" alt="" class="casePrizeImg" />
                    </div>
                `);
        } else {
          let index = random(0, element.gains.length);
          let gain = element.gains[index];

          $("#caseGains").append(`
                        <div class="casePrize" id="itemNumber${i}" data-rarity="${index}">
                            <h3 class="casePrizeName">
                                ${gain.label}
                                <p>${gain.typeLabel}</p>
                            </h3>
                            <img src="./img/${gain.img}.png" alt="" class="casePrizeImg" />
                        </div>
                    `);
        }
      }

      $(".casePrize").first().css("margin-left", 0);

      let childNumber = 40;

      $(".casePrize")
        .first()
        .animate(
          {
            marginLeft: -(
              $("#itemNumber" + childNumber).position().left -
              screen.width / 4
            ),
          },
          5000,
          function () {
            $("#itemNumber" + childNumber).css("background-color", "green");
            let win =
              element.gains[
                parseInt($("#itemNumber" + childNumber).attr("data-rarity"))
              ];

            (document.getElementById("sellCount").textContent = win.sell),
              $("#productConfirmationPage2").show(500);

            currentElement = function (sell) {
              if (!sell) {
                notify("Vous avez gagné : " + win.label);
              } else {
                notify("Vous avez vendu : " + win.label);
              }

              setTimeout(() => {
                $("#caseOpeningPage").hide(500);
              }, 3500);

              post("boutique:winCase", {
                gain: win,
                caseLabel: element.label,
                caseCoins: element.coins,
                sell: sell,
              });
            };
          }
        );
    } else {
      notify("~r~Vous n'avez pas assez de crédits");
    }
  };
}

function closeViewVehicle() {
  $("#vehicleViewPage").hide(500);
}

function giveCoins() {
  let inputStoreCode = document.getElementById("inputStoreCode").value;
  let inputAmount = document.getElementById("inputAmount").value;
  post("boutique:giveCoins", {
    storeCode: inputStoreCode,
    count: inputAmount,
  });
  $("#manageMenuCat").hide(500);
}

function openLink(index) {
  window.invokeNative("openUrl", tebex[index].link);
}

function useCodeButtonPromo() {
  let code = document.getElementById("promoValue").value;
  post("boutique:useCodePromo", {
    code: code,
  });
  $("#promoPage").hide(500);
}

function viewVehicle(index) {
  const element = vehicles[index];

  document.getElementById("vehicleViewPage").innerHTML = "";
  document.getElementById("vehicleViewPage").insertAdjacentHTML(
    "beforeend",
    `
        <div class="vehicleViewBox">
            <div class="vehicleViewLeftSide">
                <h2 class="vehicleViewName">
                    ${element.label}
                    <p>Véhicule</p>
                </h2>
                <img src="./img/${
                  element.img
                }.png" alt="" class="vehicleViewImg" />
                <h3 class="vehicleViewPriceBox">
                    Prix
                    <div><i class="fa-solid fa-credit-card"></i> ${
                      element.coins
                    }</div>
                </h3>
            </div>
            <div class="vehicleViewRightSide">
                <div class="vehicleInformationBox">
                    <div class="vehicleInformation">
                        <div class="vehicleInfoTitle">
                            Vitesse maximum
                            <p>${element.speed}</p>
                        </div>
                        <div class="vehicleInfoLine">
                            <div class="vehicleInfoLines"style="width: ${
                              element.speed <= 100 ? element.speed : 100
                            }%"></div>
                        </div>
                    </div>
                    <div class="vehicleInformation">
                        <div class="vehicleInfoTitle">
                            Nombre de sièges
                            <p>${element.seat}</p>
                        </div>
                        <div class="vehicleInfoLine">
                            <div class="vehicleInfoLines"style="width: ${
                              (element.seat / 6) * 100 <= 100
                                ? (element.seat / 6) * 100
                                : 100
                            }%"></div>
                        </div>
                    </div>
                </div>
                <div class="vehicleViewButtonBox">
                    <div class="testButton" onclick="testVehicle(${index})">Tester</div>
                    <div class="vehicleBuyButton" onclick="buyVehicle(${index})">Acheter maintenant</div>
                </div>
            </div>
            <div class="exitBox" onclick="closeViewVehicle()"><i class="fa-solid fa-xmark"></i></div>
        </div>
  `
  );

  $("#vehicleViewPage").show(500);
}

function setVehicles() {
  document.getElementById("vehicleListData").innerHTML = "";

  for (let [index, element] of vehicles.entries()) {
    document.getElementById("vehicleListData").insertAdjacentHTML(
      "beforeend",
      `
            <div class="productBox">
                <h4 class="productName">${element.label}<p>Véhicule</p></h4>
                <img src="./img/${element.img}.png" alt="" class="productimg" />

                <div class="productPrice">
                    <i class="fa-solid fa-credit-card"></i>
                    ${element.coins}
                </div>

                <div class="productButton" onclick="viewVehicle(${index})">Voir</div>
            </div>
        `
    );
  }
}

function setWeapons() {
  document.getElementById("weaponListData").innerHTML = "";

  for (let [index, element] of weapons.entries()) {
    document.getElementById("weaponListData").insertAdjacentHTML(
      "beforeend",
      `
            <div class="productBox">
                <h4 class="productName">${element.label}<p>Arme</p></h4>
                <img src="./img/${element.img}.png" alt="" class="productimg" />

                <div class="productPrice">
                    <i class="fa-solid fa-credit-card"></i>
                    ${element.coins}
                </div>

                <div class="productButton" onclick="buyWeapon(${index})">Acheter maintenant</div>
            </div>
        `
    );
  }
}

function setMoney() {
  document.getElementById("moneyListData").innerHTML = "";

  for (let [index, element] of money.entries()) {
    document.getElementById("moneyListData").insertAdjacentHTML(
      "beforeend",
      `
            <div class="productBox">
                <h4 class="productName">${element.label}<p>Argent</p></h4>
                <img src="./img/${element.img}.png" alt="" class="productimg" />

                <div class="productPrice">
                    <i class="fa-solid fa-credit-card"></i>
                    ${element.coins}
                </div>

                <div class="productButton" onclick="buyMoney(${index})">Acheter maintenant</div>
            </div>
        `
    );
  }
}

function setTebex() {
  document.getElementById("tebexListData").innerHTML = "";

  for (let [index, element] of tebex.entries()) {
    document.getElementById("tebexListData").insertAdjacentHTML(
      "beforeend",
      `
            <div class="creditsBox">
                <h4 class="creditsName">
                ${element.label}
            </h4>
            <img src="./img/${element.img}.png" alt="" class="creditsImg" />
            <div class="creditsBuyButton" onclick="openLink(${index})">${element.price}$</div>
        </div>
        `
    );
  }
}

function setCases() {
  document.getElementById("caseListData").innerHTML = "";

  for (let [index, element] of cases.entries()) {
    document.getElementById("caseListData").insertAdjacentHTML(
      "beforeend",
      `
            <div class="productBox">
                <h4 class="productName">${element.label}<p>Caisse</p></h4>
                <img src="./img/${element.img}.png" alt="" class="productimg" />

                <div class="productPrice">
                    <i class="fa-solid fa-credit-card"></i>
                    ${element.coins}
                </div>

                <div class="productButton" onclick="viewCase(${index})">Voir</div>
                <div class="productButton" onclick="buyCase(${index})">Acheter et ouvrir</div>
            </div>
        `
    );
  }
}

function useCodePromo() {
  $("#promoPage").show(500);
}

function closePromoCode() {
  $("#promoPage").hide(500);
}

window.addEventListener("message", function (e) {
  let event = e.data;

  if (event.type === "setVehicles") {
    vehicles = event.vehicles;
    setVehicles();
  } else if (event.type === "setWeapons") {
    weapons = event.weapons;
    setWeapons();
  } else if (event.type === "setMoney") {
    money = event.money;
    setMoney();
  } else if (event.type === "setTebex") {
    tebex = event.tebex;
    setTebex();
  } else if (event.type === "setCases") {
    cases = event.cases;
    setCases();
  } else if (event.type === "setCoins") {
    coins = event.coins;
    refreshStats();
  } else if (event.type === "setStoreCode") {
    storeCode = event.storeCode;
    refreshStats();
  } else if (event.type === "toggleState") {
    console.log("🔄 Toggle state received:", event.state);

    if (event.state) {
      console.log("📂 Opening menu...");
      $("#menuBox").fadeIn(500);

      // Initialize GameView when opening the menu
      initializeGameView();
    } else {
      console.log("📁 Closing menu - UI first, then GameView...");

      // First hide the UI with animation
      $("#menuBox").fadeOut(500, function () {
        // UI is now hidden, safe to destroy GameView
        console.log("✅ UI hidden, now destroying GameView...");
        destroyGameView();
      });
    }
  } else if (event.type === "notify") {
    notify(event.notif);
  } else if (event.type === "setBoutiqueName") {
    this.document.getElementById("boutiqueName").textContent = event.name;
  }
});

$("#menuBox").hide(0);
console.log("🚀 UI initialized - menu hidden by default");

// Initialize application
(function initializeApp() {
  console.log("🚀 Initializing application...");
  console.log("📄 Application ready");
})();

// Ensure DOM is fully loaded
document.addEventListener("DOMContentLoaded", function () {
  console.log("📄 DOM fully loaded");
  // Test GameView availability
  console.log("🔍 Testing GameView availability...");
  console.log(
    "🔍 window object keys:",
    Object.keys(window).filter((key) => key.includes("Game"))
  );
  console.log("🔍 window.GameView type:", typeof window.GameView);
  console.log("🔍 window.GameView value:", window.GameView);

  if (window.GameView && typeof window.GameView === "function") {
    console.log("✅ GameView class is available from window");
    console.log(
      "📋 GameView prototype methods:",
      Object.getOwnPropertyNames(window.GameView.prototype)
    );
  } else {
    console.error(
      "❌ GameView class is not available! Make sure gameViewLegacy.js loaded properly."
    );
    // Try to detect if script loaded but class wasn't assigned
    if (window.GameView === undefined) {
      console.error(
        "🔍 window.GameView is undefined - script may not have loaded"
      );
    } else {
      console.error(
        "🔍 window.GameView exists but is not a function:",
        typeof window.GameView
      );
    }
  }

  // Test canvas availability
  const canvas = document.querySelector("#backgroundCanvas");
  console.log("🖼️ Canvas element available:", !!canvas);
  if (canvas) {
    console.log("📏 Canvas dimensions:", canvas.width, "x", canvas.height);
  }
});

// Handle window resize for GameView
window.addEventListener("resize", () => {
  if (gameView) {
    const canvas = document.querySelector("#backgroundCanvas");
    if (canvas) {
      console.log(
        "📏 Resizing GameView:",
        window.innerWidth,
        "x",
        window.innerHeight
      );
      canvas.width = window.innerWidth;
      canvas.height = window.innerHeight;
      gameView.resize(window.innerWidth, window.innerHeight);
    }
  }
});

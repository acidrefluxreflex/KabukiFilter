/*
chrome.runtime.onMessage.addListener(function(message, sender, senderResponse){
  if(message.msg === "image"){
    fetch('https://some-random-api.ml/img/pikachu')
          .then(response => response.text())
          .then(data => {
            let dataObj = JSON.parse(data);
            senderResponse({data: dataObj, index: message.index});
          })
          .catch(error => console.log("error", error))
      return true;  // Will respond asynchronously.
  }
});
 */

window.onload = function () {
    images = document.querySelectorAll('img')
    images.forEach(function(element) {
        element.src = chrome.extension.getURL('images/targetImage.png')
        element.removeAttribute('srcset')
    })
};


const browserLanguage = function () {
  const ua = window.navigator.userAgent.toLowerCase();
  try {
    // chromeは以下で利用者のブラウザ言語を取得できる
    if (ua.indexOf("chrome") != -1) {
      return (
        navigator.languages[0] ||
        navigator.browserLanguage ||
        navigator.language ||
        navigator.userLanguage
      ).substr(0, 2);
    }
    // それ以外（例えばIEなど）は下記で取得する必要がある
    else {
      return (
        navigator.browserLanguage ||
        navigator.language ||
        navigator.userLanguage
      ).substr(0, 2);
    }
  } catch (e) {
    return undefined;
  }
};

let toggle = false;
chrome.browserAction.onClicked.addListener(function (tab) {
  if (!toggle) {
    explosion();
  }
});

function explosion() {
  if (browserLanguage() == "ja") {
    if (window.confirm("爆弾を置く! \n (最初だけ2回クリックしてください)")) {
      toggle = true;
      chrome.tabs.executeScript({ file: "explosion.js" });
    }
  } else {
    if (window.confirm("Drop bombs on this page! \n (Click twice for the first time only)")) {
      toggle = true;
      chrome.tabs.executeScript({ file: "explosion.js" });
    }
  }
}


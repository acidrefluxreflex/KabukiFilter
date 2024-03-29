browser.runtime.onMessage.addListener((request, sender, sendResponse) => {
  console.log("Received request: ", request);

  if (request.greeting === "hello") sendResponse({ farewell: "goodbye" });
});

port = browser.runtime.connectNative("com.wvgg.Damp.Damp-Extension");

port.onMessage.addListener((message) => {
  browser.tabs.query({ active: true }, (tabs) => {
    tabs.forEach((tab) => {
      browser.tabs.sendMessage(tab.id, message);
    });
  });
});
port.onDisconnect.addListener(function (disconnectedPort) {});

browser.runtime.onMessage.addListener((m) => {
  if (m === "need_damp_whitelist") {
    port.postMessage("get_damp_whitelist");
  }
});

chrome.browserAction.onClicked.addListener(function (tab) {
  //chrome.tabs.executeScript(null, { file: 'replace.js' })
});


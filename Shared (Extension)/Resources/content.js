

browser.runtime.onMessage.addListener((request, sender, sendResponse) => {
    
    const array = request["rowBlock"]
    console.log(request["rowBlock"])
    /*
    for (var arr in customCodes) {
        const regexCode = new RegExp(customCodes[arr], 'ig')
        console.log("koko🔥")
        replace(document.body, regexCode, '_');
    }
     */
    array.forEach(function(element){
         console.log(element)
         const regexCode = new RegExp(element, 'ig')
         replace(document.body, regexCode, '🤖');
       
    });

});

browser.runtime.sendMessage({ greeting: "hello" }).then((response) => {
  console.log("Received response: ", response);
});

browser.runtime.onMessage.addListener((request, sender, sendResponse) => {
  console.log("Received request: ", request);
});

browser.runtime.onMessage.addListener((message) => {
  if (typeof message.damp_whitelist !== "undefined") {
    const realUrl = document
      .querySelector("link[rel=canonical]")
      .getAttribute("href");
    if (
      realUrl &&
      document.location.hostname === "www.google.com" &&
      document.location.pathname.substr(0, 7) === "/amp/s/" &&
      document.href !== realUrl
    ) {
      const sourceDomain = document.location.pathname.split("/")[3];
      if (message.damp_whitelist.indexOf(sourceDomain) < 0) {
        console.log(
          `D’AMP web extension: forwarding from AMP hosted page to source: ${realUrl}`
        );
        document.location = realUrl;
      }
    }
  }
});

browser.runtime.sendMessage("need_damp_whitelist");

//browser.runtime.sendMessage("blockWord")

function replace(node, word, replacement) {
  switch (node.nodeType) {
    case Node.ELEMENT_NODE:
      // We don't want to replace text in an input field or textarea.
      if (
        node.tagName.toLowerCase() === "input" ||
        node.tagName.toLowerCase() === "textarea"
      ) {
        return;
      }

    // For other types of element nodes, we explicitly fall through to iterate over their children.
    case Node.DOCUMENT_NODE:
    case Node.DOCUMENT_FRAGMENT_NODE:
      // If the node is a container node, iterate over all the children and recurse into them.
      var child = node.firstChild;
      var next = undefined;
      while (child) {
        next = child.nextSibling;
        replace(child, word, replacement);
        child = next;
      }
      break;
    case Node.TEXT_NODE:
      // If the node is a text node, perform the text replacement.
      replaceTextInTextNode(node, word, replacement);
      break;
  }
}

function replaceTextInTextNode(textNode, word, replacement) {
  // Skip over nodes that aren't text nodes.
  if (textNode.nodeType !== Node.TEXT_NODE) return;

  // And text nodes that don't have any text.
  if (!textNode.nodeValue.length) return;

  // Generate a regular expression object to perform the replacement.
  var expressionForWordToReplace = new RegExp(word, "gi");
  var nodeValue = textNode.nodeValue;
  var newNodeValue = nodeValue.replace(expressionForWordToReplace, replacement);

  // Perform the replacement in the DOM if the regular expression had any effect.
  if (nodeValue !== newNodeValue) {
    textNode.nodeValue = newNodeValue;
    wordReplacementCount++;
    browser.runtime.sendMessage({ type: "Word replaced" });
  }
}

var wordReplacementCount = 0;
var wordReplacementMap = {
  "ｗｗｗ":" ",
  "ｗｗ":" ",
  "【悲報】":" ",
  "【画像あり】":" ",
  "【衝撃】":" ",
  "・・・":" ",
  "…":" ",
  "末路":" ",
  "→ 結果":" ",
"エロ動画":"_",
"アダルトビデオ":"_",
"porn":"_",
"amateuranal":"_",
"amateurblowjob":"_",
"amateurbukkake":"_",
"amateurcouple":"_",
"amateurcreampie":"_",
"amateurcuckold":"_",
"amateurcumshots":"_",
"amateurgangbang":"_",
"amateurhandjob":"_",
"amateurlesbian":"_",
"amateurmilf":"_",
"amateurorgasm":"_",
"amateurorgy":"_",
"amateurporn":"_",
"amateurporntube":"_",
"amateurporno":"_",
"amateursex":"_",
"amateursexvideos":"_",
"amateurswingers":"_",
"amateurteen":"_",
"amateurthreesome":"_",
"amateurtube":"_",
"amateurwife":"_",
"amateursgonewild":"_",
"anal":"_",
"ass":"_",
"bbw":"_",
"bukkake":"_",
"bigass":"_",
"bigassanal":"_",
"bigassporn":"_",
"bigasses":"_",
"bigblackass":"_",
"bigblackbooty":"_",
"bigblackcock":"_",
"bigblackdick":"_",
"bigblacktits":"_",
"bigboobies":"_",
"bigboobs":"_",
"bigboobsvideos":"_",
"bigbooty":"_",
"bigbootyporn":"_",
"bigbrother":"_",
"bigbutts":"_",
"bigclit":"_",
"bigcock":"_",
"bigcockporn":"_",
"bigcocks":"_",
"bigdick":"_",
"bigdickporn":"_",
"bigdicks":"_",
"bignaturaltits":"_",
"bignipples":"_",
"bigporn":"_",
"bigpussy":"_",
"bigpussylips":"_",
"bigtit":"_",
"bigtitporn":"_",
"bigtits":"_",
"bigtitsatschool":"_",
"bigtitsmilf":"_",
"bigtitsporn":"_",
"bigtitsvideos":"_",
"bigtitties":"_",
"bigboobs":"_",
"biggesttits":"_",
"bigtits":"_",
"hentai":"_",
"japanesesexshow":"_",
"japanesesexvideo":"_",
"japanesesexvideos":"_",
"japanesesquirt":"_",
"japanesestudent":"_",
"japaneseteacher":"_",
"japaneseteen":"_",
"japaneseteenfuck":"_",
"japaneseteenporn":"_",
"japaneseuncensored":"_",
"japanesewife":"_",
"kinky":"_",
"kinkylesbians":"_",
"kinkymilf":"_",
"kinkyporn":"_",
"kinkysex":"_",
"kinkyxxx":"_",
"massagecreep":"_",
"massagefuck":"_",
"massagelesbian":"_",
"massageorgasm":"_",
"massageparlor":"_",
"massagepenis":"_",
"massageporn":"_",
"massagesex":"_",
"massagesexvideo":"_",
"massagesex":"_",
"masterbating":"_",
"masterbation":"_",
"masturbating":"_",
"masturbation":"_",
"matureamateur":"_",
"matureanal":"_",
"matureblowjob":"_",
"matureboobs":"_",
"maturedp":"_",
"matureladies":"_",
"maturelesbian":"_",
"maturemasturbation":"_",
"maturemilf":"_",
"matureorgasm":"_",
"matureorgy":"_",
"matureporn":"_",
"maturesex":"_",
"matureswingers":"_",
"maturewomen":"_",
"milf":"_",
"momanal":"_",
"momfuck":"_",
"momfucks":"_",
"momfucksson":"_",
"momhot":"_",
"momporn":"_",
"mompov":"_",
"mommylovespussy":"_",
"mommyporn":"_",
"mompov":"_",
"milftits":"_",
"milfyoung":"_",
"milfs":"_",
"nsfw":"_",
"naked":"_",
"nude":"_",
"porno":"_",
"porno":"_",
"doujin":"_",
"hentai":"_",
"Hentai":"_",
"Doujinshi":"_",
"fuck":"_",
"xvideo":"_",
"hardcore":"_",
"uncensored":"_",
"donjin":"_",
"ahegao":"_",
"nhentai":"_",
"dick":"_",
"futanari":"_",
"blowjob":"_",
"handjob":"_",
"javfree":"_",
"javstream":"_",
"pornhub":"_",
"xHamster":"_",
"free jav": "_",
"pussy": "_",
"hand job" : "_",
"エロビデオ" : "_",
"エロムービー" : "_",
"エロ漫画" : "_",
"エロマンガ" : "_",
"パパ活" : "_",
"援交" : "_",
"調教" : "_",
"不倫" : "_",
"ソープ" : "_",
"オフパコ" : "_",
"ビッチ" : "_",
"dildo": "_",
"エロ同人": "_",
"寝取られ": "_",
"エロ画像": "_",
"エロい":  "_",
"おっぱい":  "_",
"ちんぽ":  "_",
"ちんこ":  "_",
"中出し":  "_",
"アダルト":  "_",
"セフレ":  "_",
"人妻":  "_",
"巨乳":  "_",
"素人ナンパ":  "_",
"爆乳":  "_",
"熟女":  "_",
"レイプ":  "_",
"Hな":  "_",
"痴漢":  "_",
"痴女":  "_",
"デカ乳":  "_",
"AV女優":  "_",
"セ●クス": "_",
"お●ぱい": "_",
"エチエチ": "_",
"エ□": "_",
"ヤリサー": "_",
"オ●ニー": "_",
"オナニー": "_",
"セ〇クス": "_",
"セックス": "_",
"ウルトラマンコスモス": "ウルトラマン コスモス",
"マンコ": "_",
"個人撮影": "_",
"アナル": "_",
"工ロ": "_",
"まんこ": "_",
"乳首": "_",
"絶頂" : "_",
"快感" : "_",
"犯され" : "_",
"エネマグラ" : "_",
"中に出" : "_",
"欲求不満" : "_",
"ディープキス" : "_",
"貧乳": "_",
"スケベ": "_",
"勃起": "_",
"エッチ": "_",
"童貞": "_",
"射精": "_",
"チンコ": "_",
"盗撮": "_",
"ハッテン": "_",
"チンポ": "_",
"亀頭": "_",
"肉棒": "_",
"ケツ穴": "_",
"ハメ撮り": "_",
"淫乱": "_",
"巨根": "_",
"メス堕ち": "_",
"カフェラテ": "カフェ ラテ",
"ペニス": "_",
"正常位": "_",
"騎乗位": "_",
"オナホ": "_",
"我慢汁": "_",
"ザーメン": "_",
"ふたなり": "_",
"ビッチ": "_",
"アヘ顔": "_",
"おちんちん": "_",
"イラマチオ": "_",
"生ハメ": "_",
"パイズリ": "_",
"クリトリス": "_",
"快楽堕ち": "_",
"寝取り": "_",
"寝取られ": "_",
"えっち": "_",
"足コキ": "_",
"手コキ": "_",
"おねショタ": "_",
"フェラ": "_",
"クンニ": "_",
"近親相姦": "_",
"乱交": "_",
"青姦": "_",
"寝取る": "_",
"ヤリマン": "_",
"犯される": "_",
"セックス": "_"
};

browser.runtime.onMessage.addListener((request, sender, sendResponse) => {
  console.log("Received request: ", request);
  console.log("Received request: ", request["blockWord"]);
  request["blockWord"].forEach(
    (element) => (wordReplacementMap[element] = "_")
  );
  console.log(wordReplacementMap);
  for (var wordToReplace in wordReplacementMap) {
    replace(document.body, wordToReplace, wordReplacementMap[wordToReplace]);
  }

  const element = document.querySelector("viewable_comment");
  element.remove();
  //<div class="sc-fGsdqw jeDDfX viewableWrap"><div id="viewable_comment" class="viewable viewable-middle"><a data-ylk="rsec:v_tpcmod;slk:comment;pos:0;" data-rapid_p="1" data-v9y="1"></a></div><div class="sc-bsbRJL ijxMmC news-comment-plugin" data-device-type="smartphone" data-page-type="short" data-full-page-url="https://headlines.yahoo.co.jp/cm/main?d=20211110-35179251-cnn-int" data-topic-id="20211110-35179251-cnn" data-space-id="1160508129" data-comment-num="2" data-display-author-banner="on" data-compact="on" data-mtestid="" data-display-blurred-comment="on"><div style="text-align: center; padding: 30px; line-height: 2em; font-family: メイリオ, &quot;ヒラギノ角ゴ Pro W3&quot;, &quot;MS PGothic&quot;, &quot;MS UI Gothic&quot;, Helvetica, Arial, sans-serif;">コメントを取得出来ませんでした<br>しばらく時間をおいてからもう一度お試しください。</div></div></div>
  $(
    'div[style="text-align: center; padding: 30px; line-height: 2em; font-family: メイリオ, &quot;ヒラギノ角ゴ Pro W3&quot;, &quot;MS PGothic&quot;, &quot;MS UI Gothic&quot;, Helvetica, Arial, sans-serif;"]'
  ).remove();
  console.log(
    $(
      'div[style="text-align: center; padding: 30px; line-height: 2em; font-family: メイリオ, &quot;ヒラギノ角ゴ Pro W3&quot;, &quot;MS PGothic&quot;, &quot;MS UI Gothic&quot;, Helvetica, Arial, sans-serif;"]'
    ).text()
  );
  $(".comModule").remove();
});

var codes = ["^.*人間*.*$"];



browser.runtime.onMessage.addListener((request, sender, sendResponse) => {
  console.log("white:🥹", request["replaceSites"]);
  const arr = request["replaceSites"];
  //.map(x => "https://" + x + "/");
  console.log("🤔", document.location.hostname);
  const nowPage = document.location.hostname;
  url = "";

  for (const elem of arr) {
    let re = new RegExp(".*" + elem.replace(/\./g, "\\.") + "*");
    if (re.test(nowPage)) {
      images = document.querySelectorAll("img");
      images.forEach(function (element) {
        element.setAttribute("src", url);
        element.removeAttribute("srcset");
      });
      console.log("🔞include");
    } else {
      console.log("not include");
    }
  }
});

browser.runtime.onMessage.addListener((request, sender, sendResponse) => {
  console.log("white:🥹", request["blurSites"]);
  const arr = request["blurSites"].map((x) => "https://" + x + "/");

  const rso = document.querySelector("div#rso");
  if (rso == null) {
    return;
  }
  for (const child of rso.children) {
    if (child.tagName === "DIV") {
      const anchors = child.getElementsByTagName("A");

      for (const a of anchors) {
        if (a.href != null && arr.some((url) => a.href.startsWith(url))) {
          if (
            child.classList.contains("g") ||
            child.querySelector(":scope > div.g")
          ) {
            //とりあえず透明にした。非表示にしたければ child.style.display = 'none'; を有効にする
            child.style.opacity = "0.25";
            child.style.filter = "blur(6px)";
            //child.style.display = 'none';
            continue;
          }
        }
      }
    }
  }
});

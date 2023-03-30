let images = document.getElementsByTagName('img');
for(let i = 0; i < images.length; i++){
  chrome.runtime.sendMessage({msg: 'image', index: i}, function({data, index}){
    images[index].src = data.link;
  });
};





browser.runtime.sendMessage({ greeting: "hello" }).then((response) => {
    console.log("Received response: ", response);
});

window.onload = function () {
    images = document.querySelectorAll('img')
    images.forEach(function(element) {
        element.src = chrome.extension.getURL('images/targetImage.png')
        element.removeAttribute('srcset')
    })
    
    
};


function replace(node, word, replacement) {
    switch (node.nodeType)
    {
        case Node.ELEMENT_NODE:
            // We don't want to replace text in an input field or textarea.
            if (node.tagName.toLowerCase() === "input" || node.tagName.toLowerCase() === "textarea") {
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
    if (textNode.nodeType !== Node.TEXT_NODE)
        return;
    
    // And text nodes that don't have any text.
    if (!textNode.nodeValue.length)
        return;
    
    // Generate a regular expression object to perform the replacement.
    var expressionForWordToReplace = new RegExp(word, "gi");
    var nodeValue = textNode.nodeValue;
    var newNodeValue = nodeValue.replace(expressionForWordToReplace, replacement);
    
    // Perform the replacement in the DOM if the regular expression had any effect.
    if (nodeValue !== newNodeValue) {
        textNode.nodeValue = newNodeValue;
        wordReplacementCount++;
        browser.runtime.sendMessage({type: "Word replaced"});
    }
}

var wordReplacementCount = 0;
var wordReplacementMap = {
    "に": " ",
       "ｗｗｗ":" ",
       "ｗｗ":" ",
       "【悲報】":" ",
       "【画像あり】":" ",
       "【衝撃】":" ",
       "・・・":" ",
       "…":" ",
       "末路":" ",
       "→ 結果":" ",
       "速報":" ",
    "ろ": "作業しよう",
    "も": "作業しよう",
    "る": "作業しよう",
    "た": "作業しよう",
    "な": "作業しよう",
    "ブ": "作業しよう",
    "画像": "作業しよう",
    "閲覧": "作業しよう",
    "注意": "作業しよう",
    "速": "作業しよう",
    "tww": "作業しよう",
    "は": "作業しよう",
    "が": "作業しよう",
    "で": "作業しよう",
    "ロ": "作業しよう",
    "投稿": "作業しよう",
    "日": "作業しよう",
    "し": "作業しよう",
    "か": "作業しよう",
    "実": "作業しよう",
    "女": "作業しよう",
    "男": "作業しよう",
    "②": "作業しよう",
    "て": "作業しよう",
    "と": "作業しよう",
    "の": "作業しよう",
    "は": "作業しよう",
    "み": "作業しよう",
    "お": "作業しよう",
    "す": "作業しよう",
    "き": "作業しよう",
    "を": "作業しよう",
    "こ": "作業しよう",
    "な": "作業しよう",
    "前": "作業しよう",
    "月": "作業しよう",
    "前": "作業しよう",
    "📣": "作業しよう",
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
    "ア":"_",
    "パ":"_",
    "ン":"_",
    "チ":"_",
    "性処理":"_",
    "舐":"_",
    "喘ぎ":"_",
    "墜ち":"_",
    "僕": "作業しよう",
    "私": "作業しよう",
    "濡": "作業しよう",
    "見": "作業しよう",
    "手": "作業しよう",
    "イ": "作業しよう",
    "キ": "作業しよう",
    "ん": "作業しよう",
    "ま": "作業しよう",
    "ら": "作業しよう",
    "妻": "作業しよう",
    "マッサージ": " ",
    "ＳＥＸ": " ",
    
    "い": " ",
    "っ": " ",
    "へ": " ",
    "気持ち" : "_",
    "SEX" : "_",
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
for (var wordToReplace in wordReplacementMap) {
    replace(document.body, wordToReplace, wordReplacementMap[wordToReplace]);
}






















//追加
browser.runtime.sendMessage({type: "Words replaced", count: wordReplacementCount});





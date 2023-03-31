//
//  TextExtension.swift
//  Eveki
//
//  Created by Kabuki Iwashita on 2022/10/19.
//

import NaturalLanguage
import SwiftUI

extension Font {

    enum Keys: String {
        ///タイトル用
        case AcademyEngravedLetPlain

        case AlNile
        case AmericanTypewriter
        case AppleColorEmoji
        case AppleSymbols
        case ArialMT
        case Baskerville
        case BodoniOrnamentsITCTT
        case Chalkduster
        case Cochin
        case Copperplate
        case Courier
        case CourierNewPSMT

        ///サイズ注意
        case Damascus

        case DevanagariSangamMN
        case Didot
        case EuphemiaUCAS
        case Farah
        case Galvji
        case GeezaPro
        case Georgia
        case GillSans
        case Helvetica
        case HelveticaNeue
        case Kailasa
        case KhmerSangamMN
        case LaoSangamMN
        case MalayalamSangamMN
        case DiwanMishafi
        case MyanmarSangamMN
        case NotoSansOriya
        case Papyrus
        case PartyLetPlain
        case SavoyeLetPlain
        case SinhalaSangamMN
        case SnellRoundhand
        case Symbol
        case TamilSangamMN
        case Thonburi
        case TimesNewRomanPSMT
        case TrebuchetMS
        case Verdana
        case ZapfDingbatsITC
        case Zapfino
        case SourceHanCodeJP
        case HiraMinProN
    }

    static func namedFont(_ name: Keys, size: CGFloat) -> Font {
        return Font.custom(name.rawValue, size: size)
    }

    static func myFont(_ size: CGFloat) -> Font {

        let name = "TrebuchetMS"

        return Font.custom(name, size: size)
    }

    static func numberFont(_ size: CGFloat) -> Font {

        let name: String = "Galvji"

        return Font.custom(name, size: size)
    }

}

extension String {

    var localized: String {
        return NSLocalizedString(self, comment: "")
    }

    func englishToPersian() -> String {
        var sum: String = ""
        var letters: [String] = []
        var character: [Character] = []
        character = Array(self)
        letters = character.map { String($0) }
        for letter: String in letters {
            if Int(letter) != nil {
                let persianNumber: [String] = ["۰", "۱", "۲", "۳", "۴", "۵", "۶", "۷", "۸", "۹"]
                sum = sum + persianNumber[Int("\(letter)")!]
            } else {
                sum = sum + letter
            }
        }
        return sum
    }

}

extension String {

    var isSafe: Bool {
        let adult_list: [String] = [
            "エロビデオ",
            "エロムービー",
            "エロ漫画",
            "エロマンガ",
            "パパ活",
            "援交",
            "調教",
            "不倫",
            "ソープ",
            "オフパコ",
            "ビッチ",
            "dildo",
            "エロ同人",
            "寝取られ",
            "エロ画像",
            "エロい",
            "おっぱい",
            "ちんぽ",
            "ちんこ",
            "中出し",
            "アダルト",
            "セフレ",
            "人妻",
            "巨乳",
            "素人ナンパ",
            "爆乳",
            "熟女",
            "レイプ",
            "Hな",
            "痴漢",
            "痴女",
            "デカ乳",
            "AV女優",
            "セ●クス",
            "お●ぱい",
            "エチエチ",
            "エ□",
            "ヤリサー",
            "オ●ニー",
            "オナニー",
            "セ〇クス",
            "セックス",
            "ウルトラマンコスモス", "ウルトラマンコスモス",
            "マンコ",
            "個人撮影",
            "アナル",
            "工ロ",
            "まんこ",
            "乳首",
            "貧乳",
            "スケベ",
            "勃起",
            "エッチ",
            "童貞",
            "射精",
            "チンコ",
            "盗撮",
            "ハッテン",
            "チンポ",
            "亀頭",
            "肉棒",
            "ケツ穴",
            "ハメ撮り",
            "淫乱",
            "巨根",
            "メス堕ち",
            "カフェラテ", "カフェラテ",
            "ペニス",
            "正常位",
            "騎乗位",
            "オナホ",
            "我慢汁",
            "ザーメン",
            "ふたなり",
            "ビッチ",
            "アヘ顔",
            "おちんちん",
            "イラマチオ",
            "生ハメ",
            "パイズリ",
            "クリトリス",
            "快楽堕ち",
            "寝取り",
            "寝取られ",
            "えっち",
            "足コキ",
            "手コキ",
            "おねショタ",
            "フェラ",
            "クンニ",
            "近親相姦",
            "乱交",
            "青姦",
            "寝取る",
            "ヤリマン",
            "犯される",
            "セックス",
        ]
        let political_list: [String] = [
            "政策",
            "会談",
            "同省",
            "自民",
            "総理",
            "与党",
            "民主",
            "政党",
            "首相",
            "議員",
            "財政",
            "行政",
            "野党",
            "右翼",
            "左翼",
        ]
        let hate_list: [String] = [
            "ツイッタラー",
            "黒人",
            "白人",
            "ネトウヨ",
            "韓国人",
            "中国人",
            "火病",
            "ダセェ",
            "そいつ",
            "こいつ",
            "やがれ",
            "アンチ",
            "クソ",
            "野郎",
            "フェミ",
            "フェミニズム",
            "ヤフコメ",
            "老害",
            "反日",
            "馬鹿",
            "あんた",
            "やれよ",
            "ニヤニヤ",
            "売国奴",
            "売国",
            "バカ",
            "パヨク",
            "ポリコレ",
            "統一教会",
            "ぶっ倒そう",
            "お前",
            "信者",
            "拝金",
            "ぶっ壊し",
        ]
        let all_list: [String] = adult_list + political_list + hate_list
        let containBadWords: Bool = tokenize().contains(where: all_list.contains)
        if containBadWords {
            return false
        } else {
            return true
        }
    }

    func tokenize() -> [String] {
        let text: String = self
        let tokenizer: NLTokenizer = NLTokenizer(unit: .word)
        tokenizer.string = text
        let tokens: [Range<String.Index>] = tokenizer.tokens(for: text.startIndex..<text.endIndex)
        var textTokens: [String] = []
        for token: Range<String.Index> in tokens {
            let tokenStart: String.Index = token.lowerBound
            let tokenEnd: String.Index = token.upperBound
            let text: Substring = text[tokenStart..<tokenEnd]
            let str: String = String(text)
            if str.count != 1 {
                textTokens.append(str)
            }
        }

        return textTokens.unique
    }
}

extension String {
    func getAttributedString() -> AttributedString {
        do {
            let attributedString = try AttributedString(markdown: self)
            return attributedString
        } catch {
            print("Couldn't parse: \(error)")
        }
        return AttributedString("Error parsing markdown")
    }
}

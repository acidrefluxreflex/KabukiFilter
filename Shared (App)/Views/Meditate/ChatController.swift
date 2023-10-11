//
//  ChatController.swift
//  BlockBadBook (iOS)
//
//  Created by Kabuki Iwashita on 2023/03/29.
//

import Alamofire
import Combine
import Firebase
import Foundation
import NaturalLanguage
import UIKit

class ChatController: ObservableObject {
    private let lc = LocalizeCodes()
    //private var repo = FireStoreRepositry()
    private let auth = AuthController()
    private var cancellables: Set<AnyCancellable> = []

    var background = UIBackgroundTaskIdentifier.invalid
    @Published var messages: [Message] = []
    @Published var userHistories: [String] = []
    @Published var botHistories: [String] = []

    @Published var fetch: Bool = false
    @Published var historyText: String = ""
    private var history: String = ""

    private var lastMessege: String = ""
    private var apiURL = "https://izumo092-zeboot.hf.space/run/predict"

    private var enApiURL = "hhttps://izumo092-zeboot.hf.space/run/predict"

    private let cnApiURL = "https://izumo092-zeboot.hf.space/run/predict"

    func send(
        text: String
    ) {
        auth.reloadUserID()
        setUserMessge(text: text)
        print(hasKeywords(in: text))
        if hasKeywords(in: text) {
            let warning = Message(
                message: "攻撃的な内容を検知しました",
                avatar: "",
                color: .secondary,
                type: .bot)
            messages.removeLast()
            messages.append(warning)

        } else {
            postAPI(text: text)
            lastMessege = text

        }
    }

    func setUserMessge(
        text: String
    ) {

        messages.append(
            .init(
                message: text,
                avatar: "",
                color: .accentColor, type: .isMe

            )
        )

        messages.append(
            Message(
                message: text,
                avatar: "",
                color: .accentColor,
                type: .loading)
        )

    }

    func postAPI(
        text: String
    ) {

        let taskIdentifier = UIApplication.shared.beginBackgroundTask(expirationHandler: {
            // 4. expirationHandlerは、バックグラウンド状態でかつendBackgroundTaskが呼ばれなかった場合に呼ばれる
            self.cancellables.forEach { $0.cancel() }
            //NotificationHelper.postLocalNotification(with: Message(body: "処理が完了しませんでした"))
            //Logger.debug(message: "cancel background task")
        })
        //Logger.debug(message: "start background task")

        var itemCode: [Any] = []
        itemCode.append(history)
        itemCode.append(text)
        let settingData: [String: Any] = ["data": itemCode]
        let jsonObject: Data = try! JSONSerialization.data(
            withJSONObject: settingData, options: .prettyPrinted)

        print(String(data: jsonObject, encoding: .utf8))

        print(apiURL)
        var request: URLRequest = URLRequest(url: URL(string: apiURL)!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = jsonObject

        AF.request(request)
            .responseData { [self] response in
                switch response.result {
                case .success(let data):
                    do {
                        guard
                            let jsonObject = try JSONSerialization.jsonObject(with: data)
                                as? [String: Any]
                        else {
                            UIApplication.shared.endBackgroundTask(taskIdentifier)
                            print("Error: Cannot convert data to JSON object")
                            return
                        }
                        guard
                            let prettyJsonData = try? JSONSerialization.data(
                                withJSONObject: jsonObject, options: .prettyPrinted)
                        else {
                            UIApplication.shared.endBackgroundTask(taskIdentifier)
                            print("Error: Cannot convert JSON object to Pretty JSON data")
                            return
                        }
                        guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8)
                        else {
                            UIApplication.shared.endBackgroundTask(taskIdentifier)
                            print("Error: Could print JSON in String")
                            return
                        }
                        print(prettyPrintedJson)
                    } catch {
                        UIApplication.shared.endBackgroundTask(taskIdentifier)
                        print("Error: Trying to convert JSON data to string")
                        return
                    }
                    let decoder: JSONDecoder = JSONDecoder()
                    guard
                        let response: ReplyResponse = try? decoder.decode(
                            ReplyResponse.self, from: data)
                    else {
                        UIApplication.shared.endBackgroundTask(taskIdentifier)
                        self.messages.append(
                            .init(
                                message: "回線エラー、少し時間をおいて再送信してみてください",
                                avatar: "",
                                color: .accentColor,
                                type: .bot
                            )
                        )
                        return
                    }
                    self.messages.removeLast()
                    if response.data[0] != nil {
                        var message = response.data[0]!
                        var sentences = self.splitSentences(text: message)

                        for sentence in sentences {
                            self.messages.append(
                                .init(
                                    message: sentence,
                                    avatar: "",
                                    color: .accentColor,
                                    type: .bot
                                )
                            )
                            print("🤖" + sentence)
                        }

                        self.history = response.data[1] ?? ""
                        var h = history.components(separatedBy: "🇹🇰🇹🇰🇹🇰")
                        self.userHistories.append(h[0])
                        self.botHistories.append(h[1])
                        makeHistoryText()
                    }
                    UIApplication.shared.endBackgroundTask(taskIdentifier)
                case .failure(let error):
                    UIApplication.shared.endBackgroundTask(taskIdentifier)
                    self.messages.append(
                        .init(
                            message: "回線エラー、少し時間をおいて再送信してみてください",
                            avatar: "",
                            color: .accentColor,
                            type: .bot
                        )
                    )
                    print(error)
                }
            }
        UIApplication.shared.endBackgroundTask(taskIdentifier)
    }

    func getAPIURL() {
        var db: Firestore = Firestore.firestore()
        let path = "appInfo"
        db.collection(path)
            //.document("V5SwOXSqz1gLzLgZQ677")
            .document("chatGPT")
            .getDocument { (document, error) in
                if let document = document, document.exists {
                    self.apiURL = document.get("apiURL") as! String
                } else {
                    print(error)
                }
            }
    }

    func getEnAPIURL() {

        var db: Firestore = Firestore.firestore()
        let path = "appInfo"
        db.collection(path)
            //.document("QEp3PORy7M3MweDRLQbY")
            .document("test")
            .getDocument { (document, error) in
                if let document = document, document.exists {
                    self.enApiURL = document.get("apiURL") as! String
                } else {
                    print(error)
                }
            }

    }

    func makeHistoryText() {
        var userText = userHistories[0]
        userText = "私:" + userText + "\n"
        var botTexts = botHistories[0].components(separatedBy: "。")
        botTexts = botTexts.map {
            "AI:" + $0 + "\n"
        }

        historyText += (userText + botTexts.joined(separator: ""))
        userHistories.removeAll()
        botHistories.removeAll()
    }

    func shareText() -> String {
        var str: String = history
        str = "私:「" + str
        str = str.replacingOccurrences(of: "人間:", with: "私:")
        str = str.replacingOccurrences(of: "」", with: "」\n")
        str.removeLast(3)
        str = str + "」"
        str = "AIアプリ #Eveki で作成しました\n" + str
        return str
    }

    private func tokenizeS(text: String) -> String {
        let tokenizer = NLTokenizer(unit: .sentence)
        tokenizer.string = text
        let tokens = tokenizer.tokens(for: text.startIndex..<text.endIndex)
        var textTokens: [String] = []
        for token in tokens {
            let tokenStart = token.lowerBound
            let tokenEnd = token.upperBound
            let text = text[tokenStart..<tokenEnd]
            textTokens.append(String(text))
        }

        return textTokens.unique[0]
    }

    private func splitSentences(text: String) -> [String] {
        let tokenizer = NLTokenizer(unit: .sentence)
        tokenizer.string = text
        let tokens = tokenizer.tokens(for: text.startIndex..<text.endIndex)
        var textTokens: [String] = []
        for token in tokens {
            let tokenStart = token.lowerBound
            let tokenEnd = token.upperBound
            let text = text[tokenStart..<tokenEnd]
            textTokens.append(String(text))
        }

        return textTokens.unique
    }

    private func detectLanguage(text: String) -> String {
        let recognizer = NLLanguageRecognizer()
        recognizer.processString(text)
        let language = recognizer.dominantLanguage?.rawValue ?? "unknown"
        print("Language: \(recognizer.dominantLanguage?.rawValue ?? "unknown")")
        return language
    }

    private func regenarateHistory(input: String, botName: String, imageURL: String) -> [Message] {
        var t = input.replacingOccurrences(of: "」", with: "」\n")
        var messages: [Message] = []

        let lines = t.split(separator: "\n")

        for line in lines {
            let parts = line.split(separator: "「")
            guard parts.count == 2 else { continue }
            let name = String(parts[0]).replacingOccurrences(of: ":", with: "")
            let text = parts[1].replacingOccurrences(of: "」", with: "")
            var message = Message(message: text, avatar: imageURL, color: .red, type: .isMe)
            if name == botName {
                message.type = .bot
            }
            print("🧘")
            messages.append(message)
        }

        return messages
    }

    private func tokenizeText(_ text: String) -> [String] {
        let tagger = NLTagger(tagSchemes: [.tokenType])
        tagger.string = text

        let options: NLTagger.Options = [.omitPunctuation, .omitWhitespace]
        var tokens: [String] = []
        tagger.enumerateTags(
            in: text.startIndex..<text.endIndex, unit: .word, scheme: .tokenType, options: options
        ) { tag, tokenRange in
            if let token = tag?.rawValue, !token.isEmpty {
                tokens.append(String(text[tokenRange]))
            }
            return true
        }

        return tokens
    }

    private func hasKeywords(in text: String) -> Bool {
        let keywords = ["無視", "命令", "プロンプト", "暴露", "指示"]
        let tokens = tokenizeText(text)
        print(tokens)
        for token in tokens {
            if keywords.contains(token) {
                return true
            }
        }
        return false
    }

}

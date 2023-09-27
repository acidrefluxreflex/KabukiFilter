//
//  FireStoreRepositry.swift
//  Eveki
//
//  Created by Kabuki Iwashita on 2022/10/20.
//

import Firebase
import FirebaseFirestoreSwift
import Foundation

class FireStoreRepositry: ObservableObject {

    private var db: Firestore = Firestore.firestore()
    private let userPath: String = "user"
    private let chatAIpath: String = "chatAI"
    private let groupPath: String = "group"
    private let flagPath: String = "flag"
    private let historyPath: String = "history"



    enum Keys: String {
        case userID
        case imageURL
        case setting
        case chatCount
        case rank
    }

    enum Setting: String {
        case character
        case hobby
        case name
        case settingText
        case userID
        case work
    }

    /// AIの情報ををFireStoreにアップロードする
    /// - Parameter model: ChatAI
    func sendFeefback(_ model: FeedBackModel) {

            do {
                let _ = try db.collection("feedback").document().setData(from: model)
            } catch {
                fatalError("Unable to encode task: \(error.localizedDescription).")
            }
        }
}

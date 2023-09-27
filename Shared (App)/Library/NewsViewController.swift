//
//  NewsViewController.swift
//  KabukiFilter
//
//  Created by Kabuki Iwashita on 2023/04/17.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class NewsViewController: ObservableObject {
    
    @Published var data: [NewsModel] = []
    private let infoPath = "appInfo"
    private let newsDoc = "news"
    private let contentPath = "content"
    var db: Firestore = Firestore.firestore()
    let repo = FireStoreRepositry()
    
    enum Keys: String {
        case title
        case body
        case image
        case link
        case date
        case language
        case code
    }
    
    func load() {
        getNews()
    }
    
    private func getNews() {
        print("🇹🇰🇹🇰🇹🇰🇹🇰🇹🇰🇹🇰🇹🇰🇹🇰🇹🇰🇹🇰🇹🇰🇹🇰🇹🇰🇹🇰")
        db.collection(infoPath)
            .document(newsDoc)
            .collection(contentPath)
            .whereField("code", isEqualTo: 1)
            .addSnapshotListener { (snap, err) in
                if err != nil {
                    print((err?.localizedDescription)!)
                    return
                }
                for i in snap!.documentChanges {
                    if i.type == .added {
                        
                        let news = NewsModel()
                    
                        news.title = i.document.get(Keys.title.rawValue) as! String
                        news.body = i.document.get(Keys.body.rawValue) as! String
                        news.image = i.document.get(Keys.image.rawValue) as! String
                        news.link = i.document.get(Keys.link.rawValue) as! String
                        news.date = i.document.get(Keys.date.rawValue) as! Timestamp
                        news.language = i.document.get(Keys.language.rawValue) as! String
                        news.code = i.document.get(Keys.code.rawValue) as! Int
                        self.data.append(news)
                        
                        
                    }
                    
                }
            }
        data = data.unique
    }
}

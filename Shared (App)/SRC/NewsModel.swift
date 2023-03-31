//
//  NewsModel.swift
//  BlockBadBook
//
//  Created by Kabuki Iwashita on 2023/03/28.
//



import SwiftUI


class NewsModel: ObservableObject, Codable, Identifiable {
    
    @Published var title: String = "Sample News"
    @Published var body: String = "It is sample news. It will give you new infomation."
    @Published var language: String = "日本語"
    @Published var code: Int = 0
    @Published var date: Date = Date()
    
    init() {
        
    }
    
    enum CodingKeys: CodingKey {
        case title
        case body
        case language
        case code
        case date
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        body = try container.decode(String.self, forKey: .body)
        language = try container.decode(String.self, forKey: .language)
        code = try container.decode(Int.self, forKey: .code)
        date = try container.decode(Date.self, forKey: .date)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(body, forKey: .body)
        try container.encode(language, forKey: .language)
        try container.encode(code, forKey: .code)
        try container.encode(date, forKey: .date)
    }

}



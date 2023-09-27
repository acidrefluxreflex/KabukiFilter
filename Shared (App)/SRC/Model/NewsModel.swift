import SwiftUI
import FirebaseFirestore

class NewsModel: ObservableObject, Codable, Identifiable, Equatable {
    static func == (lhs: NewsModel, rhs: NewsModel) -> Bool {
        return lhs.date == lhs.date
    }
    
    
    @Published var title: String = "Sample News"
    @Published var body: String = "It is sample news. It will give you new infomation."
    @Published var image: String = ""
    @Published var link: String = "https://note.com/izumo092"
    @Published var language: String = "日本語"
    @Published var code: Int = 0
    @Published var date: Timestamp = Timestamp()
    
    init() {
        
    }
    
    enum CodingKeys: CodingKey {
        case title
        case body
        case image
        case link
        case language
        case code
        case date
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        body = try container.decode(String.self, forKey: .body)
        image = try container.decode(String.self, forKey: .image)
        link = try container.decode(String.self, forKey: .link)
        language = try container.decode(String.self, forKey: .language)
        code = try container.decode(Int.self, forKey: .code)
        date = try container.decode(Timestamp.self, forKey: .date)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(body, forKey: .body)
        try container.encode(image, forKey: .image)
        try container.encode(link, forKey: .link)
        try container.encode(language, forKey: .language)
        try container.encode(code, forKey: .code)
        try container.encode(date, forKey: .date)
    }

}


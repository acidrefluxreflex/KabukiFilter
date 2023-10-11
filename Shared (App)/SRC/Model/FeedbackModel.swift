//
//  FeedBackModel.swift
//  Eveki
//
//  Created by Kabuki Iwashita on 2023/01/16.
//

//
//  File.swift
//  Eveki
//
//  Created by Kabuki Iwashita on 2022/11/08.
//

import FirebaseFirestore
import FirebaseFirestoreSwift
import Foundation

class FeedBackModel: ObservableObject, Codable, Identifiable {

    @Published var name: String = ""
    @Published var text: String = ""
    @Published var rating: Int = 1

    var date = Timestamp()

    init() {
    }

    enum CodingKeys: CodingKey {
        case reason
        case text
        case rating
        case date
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .reason)
        text = try container.decode(String.self, forKey: .text)
        rating = try container.decode(Int.self, forKey: .rating)
        date = try container.decode(Timestamp.self, forKey: .date)
    }

    func encode(to encoder: Encoder) throws {
        var container: KeyedEncodingContainer<FeedBackModel.CodingKeys> = encoder.container(
            keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .reason)
        try container.encode(text, forKey: .text)
        try container.encode(rating, forKey: .rating)
        try container.encode(date, forKey: .date)
    }

}

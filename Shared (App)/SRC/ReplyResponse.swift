//
//  ReplyResponse.swift
//  KabukiFilter
//
//  Created by Kabuki Iwashita on 2023/04/01.
//

import Foundation

class ReplyResponse: Codable {
    let duration: Double
    let data: [String?]
    let averageDuration: Double
    let isGenerating: Bool

    enum CodingKeys: String, CodingKey {
        case duration, data
        case averageDuration = "average_duration"
        case isGenerating = "is_generating"
    }

    init(duration: Double, data: [String?], averageDuration: Double, isGenerating: Bool) {
        self.duration = duration
        self.data = data
        self.averageDuration = averageDuration
        self.isGenerating = isGenerating
    }
}

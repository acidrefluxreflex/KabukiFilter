//
//  MessageModel.swift
//  PureFilter (iOS)
//
//  Created by Kabuki Iwashita on 2023/03/30.
//

import Foundation
import SwiftUI

struct Message: Hashable {
    var message: String
    var avatar: String
    var color: Color
    // isMe will be true if We sent the message
    var type: MessageType = .bot
    let id: String = UUID().uuidString
}

enum MessageType {
    case isMe
    case bot
    case loading
}

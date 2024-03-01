//
//  Conversation.swift
//  Servx
//
//  Created by Makhlug Jafarov on 15/01/2024.
//

import Foundation
import Firebase

struct Conversation: Identifiable, Codable {
    var id: String
    var participants: [String]
    var lastMessage: String
    var lastMessageTimestamp: Timestamp
}

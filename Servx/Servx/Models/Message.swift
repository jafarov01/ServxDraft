//
//  Message.swift
//  Servx
//
//  Created by Makhlug Jafarov on 15/01/2024.
//

import Foundation
import Firebase

struct Message: Identifiable, Codable {
    var id: String
    var content: String
    var senderId: String
    var receiverId: String
    var timestamp: Timestamp
}

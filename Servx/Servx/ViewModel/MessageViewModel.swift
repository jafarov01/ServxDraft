//
//  MessageViewModel.swift
//  Servx
//
//  Created by Makhlug Jafarov on 15/01/2024.
//

import Foundation
import Firebase

class MessageViewModel: ObservableObject {
    @Published var messages = [Message]()
    
    private var db = Firestore.firestore()
    
    func fetchMessages(conversationId: String) {
        db.collection("conversations").document(conversationId).collection("messages")
            .order(by: "timestamp", descending: false)
            .addSnapshotListener { querySnapshot, error in
                guard let documents = querySnapshot?.documents else {
                    print("No messages found in this conversation")
                    return
                }
                
                self.messages = documents.compactMap { document -> Message? in
                    try? document.data(as: Message.self)
                }
            }
    }
    
    func sendMessage(conversationId: String, message: Message) {
        do {
            try db.collection("conversations").document(conversationId).collection("messages").document().setData(from: message)
        } catch {
            print("There was an error sending the message: (error.localizedDescription)")
        }
    }
}

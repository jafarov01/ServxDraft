//
//  ConversationViewModel.swift
//  Servx
//
//  Created by Makhlug Jafarov on 15/01/2024.
//

import Foundation
import Firebase

class ConversationViewModel: ObservableObject {
    @Published var conversations = [Conversation]()

    private var db = Firestore.firestore()

    func fetchConversations(userId: String) {
        db.collection("conversations").whereField("participants", arrayContains: userId)
            .addSnapshotListener { querySnapshot, error in
                guard let documents = querySnapshot?.documents else {
                    print("No conversations found")
                    return
                }

                self.conversations = documents.compactMap { document -> Conversation? in
                    try? document.data(as: Conversation.self)
                }
            }
    }
}

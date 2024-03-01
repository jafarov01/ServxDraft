//
//  InboxView.swift
//  Servx
//
//  Created by Makhlug Jafarov on 28/10/2023.
//

import SwiftUI

struct InboxView: View {
    @ObservedObject var viewModel = ConversationViewModel()
    let currentUserId = AuthenticatedUser.shared.id

    var body: some View {
        NavigationStack {
            List(viewModel.conversations) { conversation in
                NavigationLink(destination: SingleMessageView(conversationId: conversation.id)) {
                    ConversationRow(conversation: conversation)
                }
            }
            .navigationBarTitle("Inbox")
            .onAppear {
                viewModel.fetchConversations(userId: currentUserId)
            }
        }
    }
}

struct InboxView_Previews: PreviewProvider {
    static var previews: some View {
        InboxView()
    }
}


//
//  MessageRow.swift
//  Servx
//
//  Created by Makhlug Jafarov on 15/01/2024.
//

import SwiftUI

struct ConversationRow: View {
    var conversation: Conversation
    
    var body: some View {
        HStack {
            // Display an icon or image for the user
            Circle()
                .fill(Color.blue)
                .frame(width: 50, height: 50)

            VStack(alignment: .leading) {
                // Replace with actual participant's name
                Text("Participant Name")
                    .font(.headline)
                    .foregroundColor(.primary)

                Text(conversation.lastMessage)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(1)

                Text("\(conversation.lastMessageTimestamp)")
                    .font(.caption)
                    .foregroundColor(.gray)
            }

            Spacer()
        }
        .padding(.vertical, 8)
        .background(Color("greyscale100Color"))
        .cornerRadius(10)
    }
}

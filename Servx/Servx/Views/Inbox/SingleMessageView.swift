//
//  SingleMessageView.swift
//  Servx
//
//  Created by Makhlug Jafarov on 15/01/2024.
//

import SwiftUI
import Firebase

struct SingleMessageView: View {
    var conversationId: String
    @ObservedObject var viewModel = MessageViewModel()
    @State var messageText: String = ""
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(viewModel.messages) { message in
                    HStack {
                        if message.senderId == "currentUser" {
                            Spacer() // Adjust based on the sender
                        }
                        Text(message.content)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                        if message.senderId != "currentUser" {
                            Spacer()
                        }
                    }
                }
            }
            
            HStack {
                TextField("Write a message...", text: $messageText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button("Send") {
                    let newMessage = Message(id: UUID().uuidString, content: messageText, senderId: "currentUser", receiverId: "otherUserId", timestamp: Timestamp())
                    viewModel.sendMessage(conversationId: conversationId, message: newMessage)
                    messageText = ""
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
        .navigationBarTitle("Conversation", displayMode: .inline)
        .onAppear {
            viewModel.fetchMessages(conversationId: conversationId)
        }
    }
    
}

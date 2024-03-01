//
//  UserProfileEditView.swift
//  Servx
//
//  Created by Makhlug Jafarov on 19/10/2023.
//

import SwiftUI

struct CustomInputField: View {
    var title: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
            HStack {
                Image(systemName: "person.circle.fill")
                    .frame(width: 30, height: 40)
                TextField("", text: $text)
            }
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .inset(by: 0.5)
                    .stroke(Color(red: 0.91, green: 0.91, blue: 0.99), lineWidth: 1)
            )
        }
    }
}

struct UserProfileEditView: View {
    @ObservedObject var editViewModel = UserProfileEditViewViewModel()
    @ObservedObject var profileViewModel = UserProfileViewViewModel()
    @ObservedObject var profilePhotoViewModel = ProfilePhotoViewModel()
    @ObservedObject var authUser = AuthenticatedUser.shared
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Your Profile")
                .frame(maxWidth: .infinity, alignment: .center)
            
            VStack {
                ProfilePhotoEditView()
                
                CustomInputField(title: "Your name", text: $editViewModel.name)
                CustomInputField(title: "Phone number", text: $editViewModel.phoneNumber)
                CustomInputField(title: "Change password", text: $editViewModel.inputCurrentPassword)
                CustomInputField(title: "New password", text: $editViewModel.newPassword)
                CustomInputField(title: "Retype your new password", text: $editViewModel.retypePassword)
            }
            
            Spacer()
            
            VStack {
                ServxButtonView(height: 56, width: 342, handler: {
                    editViewModel.updateUserData()
                    dismiss()
                }, label: "Save", textColor: .white, backgroundColor: Color("primary500Color"))
                
                Button(action: {}, label: {
                    Text("Become a service provider")
                })
            }
        }
        .padding(24)
        .onAppear() {
            editViewModel.name = authUser.fullname
            editViewModel.phoneNumber = authUser.phoneNumber
            profileViewModel.fetchUserData()
        }
    }
}

#Preview {
    UserProfileEditView()
}

//
//  CreateProfileCustomerView.swift
//  Servx
//
//  Created by Makhlug Jafarov on 17/10/2023.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseAuth

struct CreateProfileCustomerInputView : View {
    @State var isRememberMe = false
    @ObservedObject private var viewModel = CreateProfileViewViewModel()
    @State var signedUpSuccess = false
    
    var body: some View {
        
        VStack(spacing:24, content: {
            
            ServxInputView(text: $viewModel.fullName, placeholder: "Full name", isSecure: false, frameColor: Color("primary100Color"), backgroundColor: .white, textColor: Color("primary300Color"))
            
            ServxInputView(text: $viewModel.email, placeholder: "Email", isSecure: false, frameColor: Color("primary100Color"), backgroundColor: .white, textColor: Color("primary300Color"))
            
            ServxInputView(text: $viewModel.phoneNumber, placeholder: "Phone Number", isSecure: false, frameColor: Color("primary100Color"), backgroundColor: .white, textColor: Color("primary300Color"))
            
            ServxInputView(text: $viewModel.address, placeholder: "Current address", isSecure: false, frameColor: Color("primary100Color"), backgroundColor: .white, textColor: Color("primary300Color"))
            
            HStack {
                ServxInputView(text: $viewModel.zipCode, placeholder: "Zip Code", isSecure: false, frameWidth: 167, frameColor: Color("primary100Color"), backgroundColor: .white, textColor: Color("primary300Color"))
                
                ServxInputView(text: $viewModel.state, placeholder: "State", isSecure: false, frameWidth: 167, frameColor: Color("primary100Color"), backgroundColor: .white, textColor: Color("primary300Color"))
            }
            
            ServxInputView(text: $viewModel.password, placeholder: "Password", isSecure: true, frameColor: Color("primary100Color"), backgroundColor: .white, textColor: Color("primary300Color"))
            
            Toggle(isOn: $isRememberMe) {
                Text("Remember me")
            }.toggleStyle(.switch)
                .padding(.horizontal, 25)
            
            ServxButtonView(height: 56, width: 342, handler: {
                viewModel.createProfile()
            }, label: "Continue", textColor: .white, backgroundColor: Color("primary200Color"))
            
        })
        .navigationDestination(isPresented: $viewModel.isSignedUp, destination: {
            EmailVerificationView()
        })
        
    }
}

#Preview {
    CreateProfileCustomerInputView()
}

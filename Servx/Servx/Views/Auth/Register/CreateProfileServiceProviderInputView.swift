//
//  CreateProfileServiceProviderView.swift
//  Servx
//
//  Created by Makhlug Jafarov on 17/10/2023.
//

import SwiftUI
import Firebase

struct CreateProfileServiceProviderInputView: View {
    @State var isRememberMe = false
    @ObservedObject private var viewModel = CreateProfileServiceProviderViewModel()
    @State var signedUpSuccess = false
    
    var body: some View {
        
        VStack(spacing:24, content: {
            
            ServxInputView(text: $viewModel.email, placeholder: "Email", isSecure: false, frameColor: Color("primary100Color"), backgroundColor: .white, textColor: Color("primary300Color"))
            
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
    CreateProfileServiceProviderInputView()
}

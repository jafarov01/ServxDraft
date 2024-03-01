//
//  ForgotPasswordView.swift
//  Servx
//
//  Created by Makhlug Jafarov on 15/10/2023.
//

import Foundation
import SwiftUI

struct ForgotPasswordView: View {
    
    @StateObject var viewModel = ForgotPasswordViewViewModel()
    @State private var email: String = ""
    @Environment(\.dismiss) var dismiss
    @State var clickedSendOTP : Bool = false
    
    var body: some View {
        
        VStack(content: {
            HStack(spacing: 12) {
                ServxTextView(text: "Forgot Password", fontStyle: "Poppins", fontSize: 24, fontColor: Color("primary500Color"), isBold: true, isItalic: false, textAlignment: .center)
                
                Image("authKeyImage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .padding(.leading, 35)
            }
            
            ServxTextView(text: "Enter your email adress to get an email to reset your password", fontStyle: "Poppins", fontSize: 16, fontColor: Color("greyscale400Color"), isBold: true, isItalic: false, textAlignment: .center).padding()
            
            ServxInputView(text: $viewModel.email, placeholder: "Email", isSecure: false, frameColor: Color("primary100Color"), backgroundColor: Color("othersWhiteColor"), textColor: Color("primary300Color"))
            
            Spacer()
            
            ServxTextView(text: "Please, reset your password using the link sent to your email, after clicking the button below", fontStyle: "Poppins", fontSize: 16, fontColor: Color("greyscale400Color"), isBold: true, isItalic: false, textAlignment: .center)
                .padding()
            
            ServxButtonView(height: 56, width: 342, handler: {
                viewModel.sendOTP()
                clickedSendOTP = true
            }, label: "Send Reset Password Email", textColor: Color("othersWhiteColor"), backgroundColor: Color("primary400Color"))
        })
        .navigationDestination (
            isPresented: $clickedSendOTP) {
                LoginView()
            }
    }
}

#Preview {
    ForgotPasswordView()
}

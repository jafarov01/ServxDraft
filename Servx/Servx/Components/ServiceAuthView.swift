//
//  ServiceAuth.swift
//  Servx
//
//  Created by Makhlug Jafarov on 15/10/2023.
//

import Foundation
import SwiftUI

struct ServiceAuthView: View {
    
    var hasAccount : Bool
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        VStack(spacing: 10) {
            HStack(spacing: 10) {
                VStack {
                    Divider()
                }
                
                ServxTextView(text: hasAccount ? "or sign in with" : "or sign up with", fontStyle: "SF Pro Display", fontSize: 12, fontColor: Color("greyscale500Color"), isBold: false, isItalic: false, textAlignment: .center)
                
                VStack {
                    Divider()
                }
            }
            
            HStack(spacing: 16) {
                ServiceButtonView(image: "authGoogle", handler: {})
                ServiceButtonView(image: "authApple", handler: {})
                ServiceButtonView(image: "authFacebook", handler: {})
            }
            
            HStack(spacing: 5) {
                if hasAccount {
                    NavigationLink {
                        CreateProfileView()
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        HStack{
                            ServxTextView(text:"Don\'t have an account?", fontStyle: "Poppins", fontSize: 13, fontColor: Color("primary400Color"), isBold: true, isItalic: false, textAlignment: .center)
                            ServxTextView(text: "Sign up", fontStyle: "Poppins", fontSize: 13, fontColor: Color("secondary500Color"), isBold: true, isItalic: false, textAlignment: .center)
                        }
                        .navigationBarBackButtonHidden(true)
                    }
                    
                } else {
                    Button {
                        dismiss()
                    } label: {
                        HStack{
                            ServxTextView(text: "Have an account", fontStyle: "Poppins", fontSize: 13, fontColor: Color("primary400Color"), isBold: true, isItalic: false, textAlignment: .center)
                            ServxTextView(text: "Sign in", fontStyle: "Poppins", fontSize: 13, fontColor: Color("secondary500Color"), isBold: true, isItalic: false, textAlignment: .center)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ServiceAuthView(hasAccount: true)
}

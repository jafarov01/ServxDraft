//
//  RegisterWelcomeView.swift
//  Servx
//
//  Created by Makhlug Jafarov on 16/10/2023.
//

import Foundation
import SwiftUI

struct RegisterWelcomeView: View {
    @State var email : String = ""
    
    var body: some View {
        
        
        
        ZStack {
            Color("primary400Color").edgesIgnoringSafeArea(.all)
            
            VStack() {
                
                HStack {
                    ServxTextView(text: "Welcome", fontStyle: "Poppins", fontSize: 36, fontColor: Color("primary100Color"), isBold: true, isItalic: false, textAlignment: .leading)
                        .padding(30)
                    Spacer()
                }
                HStack {
                ServxTextView(text: "Get started with Servx! Create your account to access a world of services.", fontStyle: "Poppins", fontSize: 12, fontColor: Color("primary100Color"), isBold: true, isItalic: false, textAlignment: .leading)
                    .padding(30)
                    Spacer()
                }
                
                ServxInputView(text: $email, placeholder: "Email", isSecure: false, frameColor: Color("primary100Color"), backgroundColor: .white, textColor: Color("primary300Color"))
                
                Spacer()
                
                ServxButtonView(height: 56, width: 342, handler: {}, label: "Continue", textColor: Color("primary300Color"), backgroundColor: .white)
            }
        }
    }
}


#Preview {
        RegisterWelcomeView()
}

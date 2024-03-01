//
//  WelcomeBackResetPasswordView.swift
//  Servx
//
//  Created by Makhlug Jafarov on 16/10/2023.
//

import Foundation
import SwiftUI

struct WelcomeBackResetPasswordView : View {
    
    var body: some View {
        
        VStack(content: {
            Image("servxLogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, maxHeight: 200)
                .padding(50)
            
            ServxTextView(text: "Welcome Back", fontStyle: "Poppins", fontSize: 32, fontColor: Color("primary500Color"), isBold: true, isItalic: false, textAlignment: .center)
            
            ServxTextView(text: "You have successfully reset and created a new password", fontStyle: "Poppins", fontSize: 16, fontColor: Color("primary400Color"), isBold: true, isItalic: false, textAlignment: .center)
                .padding(3)
            
            ServxButtonView(height: 56, width: 342, handler: {}, label: "Continue to Home", textColor: Color("othersWhiteColor"), backgroundColor: Color("primary500Color"))
        })
        
    }
    
}

#Preview {
        WelcomeBackResetPasswordView()
}

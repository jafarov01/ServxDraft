//
//  CreateNewPasswordView.swift
//  Servx
//
//  Created by Makhlug Jafarov on 16/10/2023.
//

import Foundation
import SwiftUI

struct CreateNewPasswordView : View {
    
    @State var password : String = ""
    @State var againPassword : String = ""
    
    var body: some View {
        VStack(content: {
            
            HStack{
                ServxTextView(text: "Create new password", fontStyle: "Poppins", fontSize: 24, fontColor: Color("primary500Color"), isBold: true, isItalic: false, textAlignment: .center)
                
                Image("authKeyImage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .padding(.leading, 8)
            }
            .padding(0)
            
            ServxTextView(text: "Set new password that is different from previous passwords for your account", fontStyle: "Poppins", fontSize: 14, fontColor: Color("greyscale500Color"), isBold: true, isItalic: false, textAlignment: .center)
                .padding()
            
            ServxInputView(text: $password, placeholder: "Password", isSecure: true, frameColor: Color("primary100Color"), backgroundColor: Color("othersWhiteColor"), textColor: Color("primary300Color"))
            
            ServxInputView(text: $againPassword, placeholder: "Password", isSecure: true, frameColor: Color("primary100Color"), backgroundColor: Color("othersWhiteColor"), textColor: Color("primary300Color"))
            
            ServxButtonView(height: 56, width: 342, handler: {}, label: "Confirm", textColor: Color("othersWhiteColor"), backgroundColor: Color("primary400Color"))
        })
    }
    
}

#Preview {
        CreateNewPasswordView()
    }

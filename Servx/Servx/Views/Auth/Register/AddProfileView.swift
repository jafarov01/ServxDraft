//
//  AddProfileView.swift
//  Servx
//
//  Created by Makhlug Jafarov on 17/10/2023.
//

import Foundation
import SwiftUI

struct AddProfileView : View {
    
    var body: some View {
        VStack(content: {
            ServxTextView(text: "Welcome to Servx", fontStyle: "Poppins", fontSize: 24, fontColor: Color("primary500Color"), isBold: true, isItalic: false, textAlignment: .center)
            
            ServxTextView(text: "Start to create profile", fontStyle: "Poppins", fontSize: 16, fontColor: Color("othersBlackColor"), isBold: true, isItalic: false, textAlignment: .center)
                .padding(10)
            
            Image("profileIconImage")
            
            Button(action: {}) {
                ServxTextView(text: "Add Profile", fontStyle: "Poppins", fontSize: 14, fontColor: Color("primary400Color"), isBold: true, isItalic: false, textAlignment: .center)
                    .padding(10)

            }
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("primary400Color"), lineWidth: 0.1))
        })
    }
    
}

#Preview {
    AddProfileView()
}

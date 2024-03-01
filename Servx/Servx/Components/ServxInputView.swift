//
//  ServxInputView.swift
//  Servx
//
//  Created by Makhlug Jafarov on 15/10/2023.
//

import Foundation
import SwiftUI

struct ServxInputView: View {
    @Binding var text: String
    var placeholder: String
    var isSecure: Bool
    var frameWidth: CGFloat = 340
    @State var showPassword: Bool = false
    var frameColor: Color
    @State var backgroundColor: Color
    var textColor: Color

    var body: some View {
        ZStack(alignment: .trailing) {
            if isSecure && !showPassword {
                SecureField(placeholder, text: $text)
                    .bold()
                    .foregroundColor(textColor)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(frameColor, lineWidth: 1)
                    )
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(backgroundColor)
                    )
                    .frame(width: frameWidth)
                
                

            } else {
                TextField(placeholder, text: $text)
                    .bold()
                    .foregroundColor(textColor) // Set text color
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(frameColor, lineWidth: 1) // Set the frame color
                    )
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(backgroundColor))
                    .frame(width: frameWidth)
            }
            if isSecure {
                Button(action: { showPassword.toggle() }) {
                    Image(systemName: showPassword ? "eye" : "eye.slash")
                        .padding(10)
                }
            }
        }
    }
}

#Preview {
        LoginView()
}

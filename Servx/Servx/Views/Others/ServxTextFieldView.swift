//
//  ServxTextFieldView.swift
//  Servx
//
//  Created by Makhlug Jafarov on 15/10/2023.
//

import Foundation
import SwiftUI

struct ServxTextFieldView: View {
    @Binding var text: String
    var placeholder: String
    @Binding var isSecure: Bool
    var frameColor: Color
    var backgroundColor: Color
    var textColor: Color

    var body: some View {
        ZStack(alignment: .trailing) {
            if isSecure {
                if isSecure {
                    TextField(placeholder, text: $text)
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
                        .frame(width: 340)
                } else {
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
                        .frame(width: 340)
                }

                Button(action: {
                    isSecure.toggle() // Toggle isSecure using @Binding
                }) {
                    Image(systemName: isSecure ? "eye" : "eye.slash")
                        .padding(10)
                }
            } else {
                TextField(placeholder, text: $text)
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
                    .frame(width: 340)
            }
        }
    }
}

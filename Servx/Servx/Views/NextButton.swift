//
//  NextButton.swift
//  Servx
//
//  Created by Makhlug Jafarov on 13/10/2023.
//

import SwiftUI

struct NextButton: View {
    var title: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(Font.cusso, ptom("Poppins", size: 16).weight(.medium))
                .lineSpacing(24)
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 16, leading: 24, bottom: 16, trailing: 24))
        }
        .frame(maxWidth: .infinity, minHeight: 56, maxHeight: 56)
        .background(Color(red: 0.28, green: 0.25, blue: 0.56))
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .inset(by: 0.50)
                .stroke(Color(red: 0.75, green: 0.74, blue: 0.74), lineWidth: 0.50)
        )
    }
}


#Preview {
        NextButton(title: "Next", action: {})
}

//
//  ServxText.swift
//  Servx
//
//  Created by Makhlug Jafarov on 15/10/2023.
//

import Foundation
import SwiftUI

struct ServxTextView : View {
    var text: String
    var fontStyle: String
    var fontSize: CGFloat // Use CGFloat for font size
    var fontColor: Color
    var isBold: Bool
    var isItalic: Bool
    var textAlignment: TextAlignment
    
    var body: some View {
        Text(text)
            .font(.custom("HelveticaNeue-Bold", size: fontSize))
            .foregroundColor(fontColor)
            .fontWeight(isBold ? .bold : .regular)
            .italic(isItalic)
            .multilineTextAlignment(textAlignment)
    }
}

#Preview {
        LoginView()
}

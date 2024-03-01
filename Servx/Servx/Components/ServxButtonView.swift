//
//  ServxButton.swift
//  Servx
//
//  Created by Makhlug Jafarov on 15/10/2023.
//

import Foundation
import SwiftUI

struct ServxButtonView: View {
    var height : CGFloat
    var width : CGFloat
    var fontSize: CGFloat = 16
    var handler: () -> Void
    var label: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Button(action: handler) {
            Text(label)
                .font(.system(size: fontSize, weight: .medium))
                .foregroundColor(textColor)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .multilineTextAlignment(.center)
                .frame(width: width, height: height)
                .background(backgroundColor)
                .cornerRadius(8)
        }
       
    }
}

#Preview {
    BookingView()
        .environmentObject(TabSelection())
}

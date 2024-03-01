//
//  CategoryButton.swift
//  Servx
//
//  Created by Makhlug Jafarov on 28/10/2023.
//

import SwiftUI

struct CategoryButton: View {
    let categoryName: String
    
    var body: some View {
        VStack {
            Circle()
                .fill(Color("primary100Color"))
                .frame(width: 60, height: 60)
                .overlay {
                    Image(categoryName.lowercased() + "Icon")
                        .resizable()
                        .frame(width: 28, height: 28)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 28, height: 28)
                        .padding(.horizontal, 16)
                }
                .padding(.bottom, 12)
            
            ServxTextView(text: categoryName, fontStyle: "Poppins", fontSize: 16, fontColor: Color("greyscale900Color"), isBold: true, isItalic: false, textAlignment: .center)
        }
    }
}


#Preview {
    CategoryButton(categoryName: "Cleaning")
}

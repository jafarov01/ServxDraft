//
//  SupportView.swift
//  Servx
//
//  Created by Makhlug Jafarov on 06/12/2023.
//

import SwiftUI

struct SupportView: View {
    var body: some View {
        VStack {
            
            HStack(alignment: .top, spacing: 52) {
                Text("Chat")
                    .background() {
                        Rectangle()
                            .foregroundColor(Color("primary100Color"))
                            .frame(width: 145, height: 50)
                            .background(Color(red: 0.97, green: 0.97, blue: 1))
                            .cornerRadius(14)
                    }
                    .foregroundColor(Color("primary400Color"))
                    .fontWeight(.bold)
                    .padding(24)
                
                Spacer()
                
                Text("Call")
                    .background() {
                        Rectangle()
                            .foregroundColor(Color("secondary100Color"))
                            .frame(width: 145, height: 50)
                            .background(Color(red: 0.97, green: 0.97, blue: 1))
                            .cornerRadius(14)
                    }
                    .foregroundColor(Color("alertErrorColor"))
                    .fontWeight(.bold)
            }
            .padding(0)
            .frame(width: 342, alignment: .topLeading)
        }
    }
}

#Preview {
    SupportView()
}

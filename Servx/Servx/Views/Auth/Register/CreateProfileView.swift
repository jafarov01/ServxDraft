//
//  CreateProfileView.swift
//  Servx
//
//  Created by Makhlug Jafarov on 17/10/2023.
//

import SwiftUI
import FirebaseAuth

struct CreateProfileView: View {
    
    @State var isCustomerOnly : Bool = true
    @StateObject private var viewModel = CreateProfileViewViewModel()
        
    var body: some View {
        ScrollView {
            VStack(content: {
                ServxTextView(text: "Create Profile", fontStyle: "Poppins", fontSize: 32, fontColor: Color("primary500Color"), isBold: true, isItalic: false, textAlignment: .center).padding(.vertical, 24)
                
                HStack{
                    ServxButtonView(height: 40, width: 163, handler: {isCustomerOnly.toggle()}, label: "Customer", textColor: Color(isCustomerOnly ? "othersWhiteColor" : "greyscale500Color"), backgroundColor: Color(isCustomerOnly ? "primary500Color" : "othersWhiteColor"))
                    
                    ServxButtonView(height: 40, width: 163, handler: {isCustomerOnly.toggle()}, label: "Service Provider", textColor: Color(!isCustomerOnly ? "othersWhiteColor" : "greyscale500Color"), backgroundColor: Color(!isCustomerOnly ? "primary500Color" : "othersWhiteColor"))
                }.padding(.vertical, 24)
                
                if isCustomerOnly{
                    CreateProfileCustomerInputView()
                }else {
                    CreateProfileServiceProviderInputView()
                }
                
                
                ServiceAuthView(hasAccount: false)
            }).padding(.horizontal, 24)
        }
    }
}

#Preview {
    CreateProfileView()
}

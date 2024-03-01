//
//  FillYourProfileView.swift
//  Servx
//
//  Created by Makhlug Jafarov on 09/01/2024.
//

import SwiftUI

struct FillYourProfileView: View {
    
    @ObservedObject private var viewModel = FillYourProfileViewViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            VStack {
                ProfilePhotoEditView()
                
                CustomInputField(title: "Full name", text: $viewModel.fullname)
                CustomInputField(title: "Phone number", text: $viewModel.phoneNumber)
                
                ServxInputView(text: $viewModel.address, placeholder: "Current address", isSecure: false, frameColor: Color("primary100Color"), backgroundColor: .white, textColor: Color("primary300Color"))
                
                HStack {
                    ServxInputView(text: $viewModel.zipCode, placeholder: "Zip Code", isSecure: false, frameWidth: 167, frameColor: Color("primary100Color"), backgroundColor: .white, textColor: Color("primary300Color"))
                    
                    ServxInputView(text: $viewModel.state, placeholder: "State", isSecure: false, frameWidth: 167, frameColor: Color("primary100Color"), backgroundColor: .white, textColor: Color("primary300Color"))
                }
            }
            
            Spacer()
            
            VStack {
                ServxButtonView(height: 56, width: 342, handler: {
                    viewModel.updateUserData()
                }, label: "Save", textColor: .white, backgroundColor: Color("primary500Color"))
            }
        }
        .padding(24)
        .navigationDestination(isPresented: $viewModel.successSave, destination: {
            FillYourProfileMoreDataView()
        })
    }
}

#Preview {
    FillYourProfileView()
}

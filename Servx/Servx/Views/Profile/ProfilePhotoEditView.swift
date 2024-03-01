//
//  ProfilePhotoEditView.swift
//  Servx
//
//  Created by Makhlug Jafarov on 19/10/2023.
//

import SwiftUI

struct ProfilePhotoEditView: View {
    @State private var showSheet = false
    @ObservedObject var authUser = AuthenticatedUser.shared
    
    var body: some View {
        VStack(content: {
            Button(action: {}){
                Image(uiImage: AuthenticatedUser.shared.uiImage)
                    .resizable()
                    .cornerRadius(50)
                    .frame(width: 100, height: 100)
                    .background(Color.black.opacity(0.2))
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                    .onTapGesture {
                        showSheet = true
                    }
            }
        })
        .padding(.horizontal, 20)
        .sheet(isPresented: $showSheet) {
            ImagePicker(sourceType: .photoLibrary, selectedImage: $authUser.uiImage)
        }
    }
}
#Preview {
    ProfilePhotoEditView()
}

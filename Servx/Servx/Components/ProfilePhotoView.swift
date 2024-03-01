//
//  ProfilePhotoView.swift
//  Servx
//
//  Created by Makhlug Jafarov on 19/10/2023.
//

import SwiftUI

struct ProfilePhotoView: View {
    @ObservedObject var viewModel: ProfilePhotoViewModel
    var height : CGFloat
    var width : CGFloat
    
    init(viewModel: ProfilePhotoViewModel, width: CGFloat, height: CGFloat) {
        self.viewModel = viewModel
        self.width = width
        self.height = height
    }
    
    var body: some View {
        Image(uiImage: viewModel.profileImage)
            .resizable()
            .frame(width: width, height: height)
            .background(Color.clear)
            .clipShape(Circle())
            .onAppear() {
                viewModel.loadProfileImage()
            }
    }
}

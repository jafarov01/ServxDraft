//
//  ProfilePhotoViewViewModel.swift
//  Servx
//
//  Created by Makhlug Jafarov on 28/11/2023.
//

import Foundation
import SwiftUI

@MainActor
class ProfilePhotoViewModel: ObservableObject {
    @Published var profileImage = AuthenticatedUser.shared.uiImage
    
    init() {
        loadProfileImage()
        print("MEX changed profilephotoVIEW MODEL")
    }

    func loadProfileImage() {
        // Load the user's profile image from Firestore
        FirestoreManager.shared.getUserPhoto() { result in
            switch result {
            case .success(let image):
                DispatchQueue.main.async {
                    self.profileImage = image
                    AuthenticatedUser.shared.uiImage = image
                }
            case .failure(let error):
                print("MEX Error loading user photo: \(error)")
            }
        }
    }
}

//
//  ProfilePhotoEditViewViewModel.swift
//  Servx
//
//  Created by Makhlug Jafarov on 28/11/2023.
//

import Foundation
import SwiftUI

class ProfilePhotoEditViewModel: ObservableObject {
    @Published var selectedImage: UIImage?
    @Published var showImagePicker = false

    func loadCurrentImage() {
        // Load the current user image from Firestore and update selectedImage
        FirestoreManager.shared.getUserPhoto() { result in
            switch result {
            case .success(let image):
                DispatchQueue.main.async {
                    self.selectedImage = image
                }
            case .failure(let error):
                print("MEX Error loading user photo: \(error)")
            }
        }
    }
}

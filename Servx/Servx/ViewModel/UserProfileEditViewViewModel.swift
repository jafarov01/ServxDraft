//
//  UserProfileEditViewViewModel.swift
//  Servx
//
//  Created by Makhlug Jafarov on 27/11/2023.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore
import SwiftUI

@MainActor
final class UserProfileEditViewViewModel: ObservableObject {
    
    var profileViewModel = UserProfileViewViewModel()
    @Published var name: String = ""
    @Published var phoneNumber: String = ""
    @Published var newPassword: String = ""
    @Published var retypePassword: String = ""
    @Published var inputCurrentPassword: String = ""
    @Published var selectedImage: UIImage?
    @Published var successSave = false
    @ObservedObject var authUser = AuthenticatedUser.shared
    @ObservedObject var profilePhotoViewModel = ProfilePhotoViewModel()
    
    
    func updateUserData() {
        var shouldUpdateData = false

        if name != authUser.fullname {
            authUser.fullname = name
            shouldUpdateData = true
        }

        if phoneNumber != authUser.phoneNumber {
            authUser.phoneNumber = phoneNumber
            shouldUpdateData = true
        }

        if !newPassword.isEmpty && newPassword == retypePassword && inputCurrentPassword == authUser.password {
            authUser.password = newPassword
            shouldUpdateData = true
        }

        if shouldUpdateData {
            FirestoreManager.shared.updateUserData { error in
                if let error = error {
                    print("MEX Error updating user data: \(error.localizedDescription)")
                } else {
                    print("MEX User data updated successfully")
                    self.successSave = true
                }
            }
        }

        if  !authUser.uiImage.isEqual(UIImage(named: "profileIconImage")) {
            FirestoreManager.shared.uploadImageAndUpdateUser(selectedImage: authUser.uiImage)
            if (shouldUpdateData && self.successSave) {
                self.successSave = true
            } else if (!shouldUpdateData) {
                self.successSave = true
            }
        }
        
    }

}

//
//  FillYourProfileMoreDataViewViewModel.swift
//  Servx
//
//  Created by Makhlug Jafarov on 13/01/2024.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore
import SwiftUI

@MainActor
final class FillYourProfileMoreDataViewViewModel: ObservableObject {
    
    @Published var selectedEducation: String = ""
    @Published var selectedLanguage: String = ""
    @Published var selectedServiceArea: String = ""
    @Published var selectedServiceSubcategory : String = ""
    @Published var selectedWorkExperience: String = ""
    @Published var successSave = false
    
    func updateUserData() {
        
        AuthenticatedUser.shared.selectedEducation = selectedEducation
        AuthenticatedUser.shared.selectedLanguage = selectedLanguage
        AuthenticatedUser.shared.selectedServiceArea = selectedServiceArea
        AuthenticatedUser.shared.selectedServiceSubcategory = selectedServiceSubcategory
        AuthenticatedUser.shared.selectedWorkExperience = selectedWorkExperience
        
        FirestoreManager.shared.updateUserData { error in
            if let error = error {
                print("MEX Error updating user data: \(error.localizedDescription)")
            } else {
                print("MEX User data updated successfully")
                self.successSave = true
            }
        }
        
    }
    
}

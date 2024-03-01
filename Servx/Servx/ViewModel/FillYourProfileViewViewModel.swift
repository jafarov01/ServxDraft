//
//  FillYourProfileViewViewModel.swift
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
final class FillYourProfileViewViewModel: ObservableObject {
    
    @Published var fullname : String = ""
    @Published var phoneNumber : String = ""
    @Published var state : String = ""
    @Published var address : String = ""
    @Published var zipCode : String = ""
    @Published var successSave = false
    
    func updateUserData() {
        
        AuthenticatedUser.shared.fullname = fullname
        AuthenticatedUser.shared.phoneNumber = phoneNumber
        AuthenticatedUser.shared.address = Address(state: self.state, address: self.address, zipCode: self.zipCode)
        
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

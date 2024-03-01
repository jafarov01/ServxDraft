//
//  CreateProfileServiceProviderViewModel.swift
//  Servx
//
//  Created by Makhlug Jafarov on 09/01/2024.
//

import Foundation

import Foundation
import SwiftUI
import Firebase
import FirebaseAuth

final class CreateProfileServiceProviderViewModel: ObservableObject {
    @Published var user: UserModel? = nil
    @Published var fullName : String = ""
    @Published var email : String = ""
    @Published var phoneNumber : String = ""
    @Published var state : String = ""
    @Published var address : String = ""
    @Published var zipCode : String = ""
    @Published var password : String = ""
    @Published var isCustomerOnly = false
    @Published var isSignedUp: Bool = false
    
    func createProfile() {
        AuthenticationManager.shared.createUser(email: email, password: password) { authResult, error in
            if let error = error {
                print("MEX Error creating user: \(error)")
            } else if let authResult = authResult {
                
                AuthenticatedUser.shared.id = authResult.user.uid
                AuthenticatedUser.shared.fullname = self.fullName
                AuthenticatedUser.shared.phoneNumber = self.phoneNumber
                AuthenticatedUser.shared.email = self.email
                AuthenticatedUser.shared.photoURL = ""
                AuthenticatedUser.shared.address = Address(state: self.state, address: self.address, zipCode: self.zipCode)
                AuthenticatedUser.shared.password = self.password
                AuthenticatedUser.shared.isCustomerOnly = self.isCustomerOnly
                AuthenticatedUser.shared.createdAt = Timestamp()
                AuthenticatedUser.shared.bookedServices = []
                AuthenticatedUser.shared.bookmarkedServices = []
                
                // Save user data to Firestore
                AuthenticationManager.shared.saveUserData() { saveError in
                    if let saveError = saveError {
                        // Handle the save error internally
                        print("MEX Error saving user data: \(saveError)")
                    } else {
                        // Update the internal state (if needed)
                        self.isSignedUp = true
                        // Handle the success case internally
                        print("MEX User data saved successfully")
                    }
                }
            } else {
                // Handle unexpected error internally
                print("MEX Unexpected error during user creation")
            }
        }
    }

    
    func signUpWithGoogle() {
        // Implement Google sign up logic
    }
    
    func signUpWithApple() {
        // Implement Apple sign up logic
    }
    
    func signUpWithFacebook() {
        // Implement Facebook sign up logic
    }
}

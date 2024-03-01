//
//  EmailVerificationViewViewModel.swift
//  Servx
//
//  Created by Makhlug Jafarov on 08/12/2023.
//

import Foundation

import SwiftUI
import Firebase
import FirebaseAuth

final class EmailVerificationViewViewModel: ObservableObject {
    @Published var isVerified: Bool = false
    
    func resendVerificationLink() {
        guard let user = Auth.auth().currentUser else {
            print("MEX Error: No user is currently logged in.")
            return
        }

        // Reload the user to get the updated details
        user.reload { [weak self] (error) in
            guard let strongSelf = self else { return }

            if let error = error {
                print("MEX Error reloading user: \(error.localizedDescription)")
                // Handle the error as needed
                return
            }

            // Check if the email is verified
            if !user.isEmailVerified {
                // Resend the verification email
                user.sendEmailVerification { (error) in
                    if let error = error {
                        print("MEX Error sending verification email: \(error.localizedDescription)")
                        // Handle the error as needed
                    } else {
                        print("MEX Verification email sent successfully.")
                        // Handle success, e.g., show a message to the user
                    }
                }
            } else {
                // User's email is already verified
                print("MEX User's email is already verified.")
                // Handle accordingly, e.g., show a message to the user
            }
        }
    }

    
    func checkIfVerified() {
        guard let user = Auth.auth().currentUser else {
            print("MEX Error: No user is currently logged in.")
            return
        }
        
        user.reload { [weak self] error in
            if let error = error {
                print("MEX Error reloading user: \(error.localizedDescription)")
            } else {
                if user.isEmailVerified {
                    print("MEX Email is verified. Navigating to MainBottomNavBar.")
                    self?.isVerified = true
                } else {
                    print("MEX Email is not verified.")
                }
            }
        }
    }
}

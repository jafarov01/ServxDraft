//
//  SendOTPViewViewModel.swift
//  Servx
//
//  Created by Makhlug Jafarov on 21/11/2023.
//

import Foundation
import Firebase
import FirebaseAuth
import SwiftUI

@MainActor
final class SendOTPViewViewModel: ObservableObject {

    @Published var enteredOTP: String = ""
    @Published var isOTPMatching: Bool = false
    @Published var errorMessage: String?

    func verifyOTP(completion: @escaping (Bool) -> Void) {
        Auth.auth().verifyPasswordResetCode(enteredOTP) { error, _  in
            DispatchQueue.main.async {
                if let error = error {
                    self.errorMessage = error
                    completion(false)
                } else {
                    self.isOTPMatching = true
                    completion(true)
                }
            }
        }
    }
}

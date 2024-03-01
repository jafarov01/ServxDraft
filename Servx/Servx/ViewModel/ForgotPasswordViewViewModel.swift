//
//  ForgotPasswordViewViewModel.swift
//  Servx
//
//  Created by Makhlug Jafarov on 21/11/2023.
//

import Foundation
import SwiftUI
import FirebaseAuth
import FirebaseFirestore

@MainActor
final class ForgotPasswordViewViewModel: ObservableObject {

    @Published var isSendingOTP: Bool = false
    @Published var errorMessage: String?
    @Published var email: String = ""

    func sendOTP() {
        isSendingOTP = true

        Auth.auth().sendPasswordReset(withEmail: email) { [weak self] error in
            DispatchQueue.main.async {
                self?.isSendingOTP = false

                if let error = error {
                    self?.errorMessage = error.localizedDescription
                } else {
                    // OTP sent successfully, proceed to the next step
                }
            }
        }
    }
}


import Foundation
import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore

@MainActor
final class LoginViewViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isRememberMe: Bool = false
    @Published var isLoggedIn: Bool = false
    
    func login() {
        AuthenticationManager.shared.login(email: email, password: password) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success:
                print("MEX Success")
                self.isLoggedIn = true
            case .failure(let error):
                print("MEX Error: \(error.localizedDescription)")
            }
        }
    }

    func signInWithGoogle() {
    }
    
    func signInWithApple() {
    }
    
    func signInWithFacebook() {
    }
}

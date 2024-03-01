//
//  AuthenticationManager.swift
//  Servx
//
//  Created by Makhlug Jafarov on 26/10/2023.
//

import Foundation
import FirebaseAuth
import SwiftUI
import FirebaseFirestore

final class AuthenticationManager: ObservableObject {
    
    static let shared = AuthenticationManager()
    
    private let auth = Auth.auth()
    private let firestore = Firestore.firestore()
    
    
    @Published var isLoggedIn = Auth.auth().currentUser?.uid != nil
    
    func initialize(completion: @escaping (Result<Void, Error>) -> Void) {
        print("function DEBUG MEX called")
        
        handleAuthenticatedUser { result in
            switch result {
            case .success:
                self.isLoggedIn = true
                completion(.success(()))
            case .failure(let error):
                // Handle failure, e.g., show an error message
                print("MEX Authentication failed with error MEX : \(error.localizedDescription)")
                completion(.failure(error))
            }
        }
    }
    
    func login(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let self = self else { return }
            
            if let error = error {
                completion(.failure(error))
            } else {
                self.handleAuthenticatedUser(completion: completion)
            }
        }
    }
    
    func handleAuthenticatedUser(completion: @escaping (Result<Void, Error>) -> Void) {
        guard let currentUser = Auth.auth().currentUser else {
            completion(.failure(NSError(domain: "AppDomain", code: 4, userInfo: [NSLocalizedDescriptionKey: "MEX User verification failed"])))
            print("MEX FAILED MEX")
            return
        }
        
        let userRef = firestore.collection("users").document(currentUser.uid)
        
        userRef.getDocument { (document, error) in
            if let error = error {
                completion(.failure(error))
            } else if let document = document, document.exists {
                self.isLoggedIn = true
                self.handleUserData(document, completion: completion)
            } else {
                completion(.failure(NSError(domain: "AppDomain", code: 4, userInfo: [NSLocalizedDescriptionKey: "User document does not exist"])))
            }
        }
    }
    
    
    private func handleUserData(_ document: DocumentSnapshot, completion: @escaping (Result<Void, Error>) -> Void) {
        do {
            if let userData = try? document.data(as: AuthenticatedUser.self) {
                // Initialize AuthenticatedUser singleton and assign user data
                AuthenticatedUser.shared.id = userData.id
                AuthenticatedUser.shared.fullname = userData.fullname
                AuthenticatedUser.shared.phoneNumber = userData.phoneNumber
                AuthenticatedUser.shared.email = userData.email
                AuthenticatedUser.shared.photoURL = userData.photoURL
                AuthenticatedUser.shared.address = userData.address
                AuthenticatedUser.shared.password = userData.password
                AuthenticatedUser.shared.isCustomerOnly = userData.isCustomerOnly
                AuthenticatedUser.shared.createdAt = userData.createdAt
                print("SUCCESS MEX, \(AuthenticatedUser.shared.phoneNumber)")
                completion(.success(()))
            } else {
                // Error decoding user data
                print("MEX Error decoding user data MEX")
                completion(.failure(NSError(domain: "AppDomain", code: 4, userInfo: [NSLocalizedDescriptionKey: "Error decoding user data"])))
            }
        }
    }
    
    
    func createUser(email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> Void) {
        auth.createUser(withEmail: email, password: password) { authResult, error in
            completion(authResult, error)
        }
    }
    
    func saveUserData(completion: @escaping (Error?) -> Void) {
        let userID = AuthenticatedUser.shared.id
        
        let userRef = firestore.collection("users").document(userID)
        
        do {
            let userDictionary = try Firestore.Encoder().encode(AuthenticatedUser.shared)
            
            userRef.setData(userDictionary) { error in
                completion(error)
            }
            Auth.auth().currentUser?.sendEmailVerification()
            self.isLoggedIn = true
        } catch let error {
            print("Error encoding AuthenticatedUser.shared: \(error.localizedDescription)")
            completion(error)
        }
    }
    
    func signOut() {
        do {
            try self.auth.signOut()
        } catch let signOutError as NSError {
            print("Error signing out: \(signOutError)")
        }
    }
    
}

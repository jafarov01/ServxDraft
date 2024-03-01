//
//  UserProfileViewViewModel.swift
//  Servx
//
//  Created by Makhlug Jafarov on 26/10/2023.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore
import SwiftUI

@MainActor
final class UserProfileViewViewModel: ObservableObject {
    @Published var user: UserModel?
    @ObservedObject var profilePhotoViewModel = ProfilePhotoViewModel()
    
    init() {
        fetchUserData()
    }
    
    func fetchUserData() {
        if let uid = Auth.auth().currentUser?.uid {
            let userRef = Firestore.firestore().collection("users").document(uid)
            
            userRef.getDocument { document, error in
                DispatchQueue.main.async {
                    if let document = document, document.exists {
                        do {
                            self.user = try document.data(as: UserModel.self)
                        } catch {
                            print("MEX Error decoding user data: \(error)")
                        }
                    } else {
                        print("MEX User document does not exist")
                    }
                }
            }
        } else {
            print("MEX User is not authenticated")
        }
    }
}


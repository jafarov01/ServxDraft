//
//  ContentView.swift
//  Servx
//
//  Created by Makhlug Jafarov on 22/10/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import SwiftUI

struct Root: View {
    @EnvironmentObject private var authenticationManager: AuthenticationManager
    @State private var isInitialized = false
    
    var body: some View {
        NavigationStack {
            if Auth.auth().currentUser?.uid != nil {
                if isInitialized {
                    MainBottomNavBar()
                } else {
                    OnboardingInitView()
                        .onAppear {
                            AuthenticationManager.shared.initialize { result in
                                switch result {
                                case .success:
                                    isInitialized = true
                                case .failure(let error):
                                    print("MEX Initialization failed with error: \(error.localizedDescription)")
                                }
                            }
                        }
                }
            } else {
                LoginView()
            }
        }
        //Settings()
        //EmailVerificationView()
    }
}

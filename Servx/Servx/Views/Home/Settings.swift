//
//  HomePageView.swift
//  Servx
//
//  Created by Makhlug Jafarov on 22/10/2023.
//

import SwiftUI

@MainActor
final class SettingsViewViewModel : ObservableObject {
    
    func signOut() throws {
        AuthenticationManager.shared.signOut()
    }
    
}

struct Settings: View {
    @StateObject private var viewModel = SettingsViewViewModel()
    
    var body: some View {
        
        Button("Log out") {
            do {
                try viewModel.signOut()
                print("MEX log out tappedInside")
            } catch {
                print("MEX error")
            }
        }
        
    }
}

#Preview {
    Settings()
}

//
//  OnboardingInitViewViewModel.swift
//  Servx
//
//  Created by Makhlug Jafarov on 28/11/2023.
//

import Foundation

@MainActor
class OnboardingInitViewViewModel : ObservableObject{
    
    required init () {
        print("MEX Auth MEX fullname onboardingview: \(AuthenticatedUser.shared.email)")
        //AuthenticationManager.shared.initialize()
        print("MEX onboardingview: \(AuthenticatedUser.shared.fullname)")
    }
}

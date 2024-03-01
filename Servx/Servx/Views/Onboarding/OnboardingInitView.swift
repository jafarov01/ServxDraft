//
//  Onboarding.swift
//  Servx
//
//  Created by Makhlug Jafarov on 13/10/2023.
//

import Foundation
import SwiftUI

struct OnboardingInitView: View {
    @ObservedObject var viewModel = OnboardingInitViewViewModel()
    @State private var isActive = false
    @State private var isLoggedIn = false
    @State private var notLoggedIn = false
    
    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            ZStack {
                Image("servxLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity, maxHeight: 200)
            }
            Spacer()
            VStack(spacing: 0) {
                Text("Professional Service.")
                    .font(.custom("Poppins", size: 28, relativeTo: .title))
                    .foregroundColor(Color(red: 0.06, green: 0.03, blue: 0.33))
                Text("Fair Price")
                    .font(.custom("Poppins", size: 28, relativeTo: .title))
                    .foregroundColor(Color(red: 0.06, green: 0.03, blue: 0.33))
            }
            .frame(maxWidth: .infinity)
            Spacer()
        }
        .padding()
        .background(Color.white)
        .navigationDestination(isPresented: $notLoggedIn) {
            LoginView()
        }
        .navigationDestination(isPresented: $isLoggedIn) {
            MainBottomNavBar()
        }
    }
}


#Preview {
    OnboardingInitView()
}

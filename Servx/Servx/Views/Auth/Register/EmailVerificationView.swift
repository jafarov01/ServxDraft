//
//  EmailVerificationView.swift
//  Servx
//
//  Created by Makhlug Jafarov on 08/12/2023.
//

import SwiftUI

struct EmailVerificationView: View {
    @ObservedObject private var viewModel = EmailVerificationViewViewModel()

    var body: some View {
        VStack {
            Spacer()

            Text("Verify Your Email")
                .font(.title)
                .foregroundColor(Color("primary400Color"))
                .padding()

            Text("A verification link has been sent to your email address. Please check your inbox and click the link to verify your email.")
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding()

            Spacer()

            Button(action: {
                viewModel.resendVerificationLink()
                print("MEX Resend Verification Link tapped")
            }) {
                Text("Resend Verification Link")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("primary400Color"))
                    .cornerRadius(8)
            }
            .padding()

            Button(action: {
                print("MEX Continue tapped")
                viewModel.checkIfVerified()
            }) {
                Text("Continue")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("secondary400Color"))
                    .cornerRadius(8)
            }
            .padding()

            Spacer()
        }
        .padding()
        .navigationDestination(isPresented: $viewModel.isVerified) {
            if (AuthenticatedUser.shared.isCustomerOnly) {
                MainBottomNavBar()
            } else {
                FillYourProfileView()
            }
        }
    }
}

#Preview {
    EmailVerificationView()
}

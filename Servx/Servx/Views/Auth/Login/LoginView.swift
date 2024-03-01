import Foundation
import SwiftUI

struct LoginView: View {
    @AppStorage("rememberedEmail") var rememberedEmail: String = ""
    @AppStorage("isRememberMe") var isRememberMe: Bool = false
    @ObservedObject private var viewModel = LoginViewViewModel()
    
    var body: some View {
        VStack(spacing: 100, content:
                {
            ServxTextView(text: "Login to your Account", fontStyle: "Poppins", fontSize: 24, fontColor: Color("primary500Color"), isBold: true, isItalic: false, textAlignment: .center)
            
            
            VStack(spacing: 24, content: {
                ServxInputView(text: $viewModel.email, placeholder: "Email", isSecure: false, frameColor: Color("primary100Color"), backgroundColor: Color("othersWhiteColor"), textColor: Color("primary300Color"))
                    .onAppear {
                        if isRememberMe {
                            viewModel.email = rememberedEmail
                        }
                    }
                
                ServxInputView(text: $viewModel.password, placeholder: "Password", isSecure: true, frameColor: Color("primary100Color"), backgroundColor: Color("othersWhiteColor"), textColor: Color("primary300Color"))
                
                Toggle(isOn: $viewModel.isRememberMe) {
                    Text("Remember me")
                }
                .toggleStyle(.switch)
                .padding(.horizontal, 2)
                
                ServxButtonView(height: 56, width: 342, handler: {
                    if viewModel.isRememberMe {
                        rememberedEmail = viewModel.email
                    } else {
                        rememberedEmail = ""
                    }
                    isRememberMe = viewModel.isRememberMe
                    
                    viewModel.login()
                }, label: "Sign in", textColor: Color("othersWhiteColor"), backgroundColor: Color("primary400Color"))
                
                NavigationLink {
                    ForgotPasswordView()
                } label: {
                    ServxTextView(text: "Forgot the password?", fontStyle: "Poppins", fontSize: 12, fontColor: Color("primary400Color"), isBold: true, isItalic: false, textAlignment: .center)
                        .navigationBarBackButtonHidden(true)
                }
            })
        
            ServiceAuthView(hasAccount: true)
        })
        .padding(.horizontal, 24)
        .navigationBarBackButtonHidden(true)
        .navigationDestination (
            isPresented: $viewModel.isLoggedIn) {
                MainBottomNavBar()
            }
    }
    
    
}

#Preview {
    LoginView()
}


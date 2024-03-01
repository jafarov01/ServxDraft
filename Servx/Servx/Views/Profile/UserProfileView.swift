//
//  UserProfileView.swift
//  Servx
//
//  Created by Makhlug Jafarov on 19/10/2023.
//

import SwiftUI
import Network

struct UserProfileView: View {
    @StateObject var viewModel = UserProfileViewViewModel()
    @State var authUser = AuthenticatedUser.shared
    @State private var shouldNavigateToLogin = false
    
    var body: some View {
        
        VStack(spacing: 50, content: {
            VStack(spacing: 20,content: {
                ProfilePhotoView(viewModel: viewModel.profilePhotoViewModel, width: 140, height: 140)
                
                Text(authUser.fullname)
            })
            VStack(spacing: 20,content: {
                NavigationLink(destination: UserProfileEditView(), label: {
                    HStack(content: {
                        HStack(content: {
                            Image(systemName: "")
                            Text("Profile").font(Font.custom("Poppins", size: 20)).foregroundColor(.black)
                        })
                        Spacer()
                        Image(systemName: "chevron.forward").frame(width: 25, height: 25).foregroundColor(.black)
                        
                    })
                }).padding(.vertical, 10)
                
                NavigationLink(destination: Settings(), label: {
                    HStack(content: {
                        HStack(content: {
                            Image(systemName: "")
                            Text("Settings").font(Font.custom("Poppins", size: 20)).foregroundColor(.black)
                        })
                        Spacer()
                        Image(systemName: "chevron.forward").frame(width: 25, height: 25).foregroundColor(.black)
                        
                    })
                }).padding(.vertical, 10)
                
                NavigationLink(destination: SupportView(), label: {
                    HStack(content: {
                        HStack(content: {
                            Image(systemName: "")
                            Text("Support").font(Font.custom("Poppins", size: 20)).foregroundColor(.black)
                        })
                        Spacer()
                        Image(systemName: "chevron.forward").frame(width: 25, height: 25).foregroundColor(.black)
                        
                    })
                }).padding(.vertical, 10)
                
                Button {
                    AuthenticationManager.shared.signOut()
                    shouldNavigateToLogin = true
                } label: {
                    HStack {
                        Image(systemName: "")
                        Text("Log out")
                            .font(.custom("Poppins", size: 20))
                            .foregroundColor(.black)
                        Spacer()
                        Image(systemName: "chevron.forward")
                            .frame(width: 25, height: 25)
                            .foregroundColor(.black)
                    }
                }
                .padding(.vertical, 10)
                
            }).padding(.horizontal, 10)
            Spacer()
        }).padding(24)
            .navigationDestination (
                isPresented: $shouldNavigateToLogin) {
                    LoginView()
                }
    }
}

#Preview {
    UserProfileView()
}

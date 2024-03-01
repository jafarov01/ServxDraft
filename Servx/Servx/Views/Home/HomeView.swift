//
//  HomeView.swift
//  Servx
//
//  Created by Makhlug Jafarov on 28/10/2023.
//

import SwiftUI

struct HomeView: View {
    @State var searchInput : String = ""
    @State private var visibleCategories: [String] = []
    @ObservedObject var viewModel = HomeViewViewModel()
    @ObservedObject var authUser = AuthenticatedUser.shared
    
    let itemsPerRow = 4
    let itemsPerPage = 8
    
    var body: some View {
        NavigationStack {
            ScrollView(content: {
                
                VStack {
                    HStack {
                        ProfilePhotoView(viewModel: viewModel.profilePhotoViewModel, width: 48, height: 48)
                        
                        VStack(alignment: .leading, content: {
                            ServxTextView(text: "Good Morning 👋🏻", fontStyle: "Poppins-Black", fontSize: 14, fontColor: Color("greyscale900Color"), isBold: false, isItalic: false, textAlignment: .center)
                            
                            ServxTextView(text: authUser.fullname, fontStyle: "Poppins", fontSize: 18, fontColor: Color("primary500Color"), isBold: true, isItalic: false, textAlignment: .center)
                            
                        })
                        
                        Spacer()
                        
                        Image("notificationIcon")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 28, height: 28)
                            .padding(.horizontal, 16)
                        
                        Image("bookmarkIcon")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 28, height: 28)
                    }
                    .padding(.horizontal, 20)
                    
                    ServxInputView(text: $searchInput, placeholder: "Search for services", isSecure: false, frameColor: Color("greyscale400Color"), backgroundColor: Color("greyscale100Color"), textColor: Color("greyscale900Color"))
                        .padding(.top, 20)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0..<10) { index in
                                RoundedRectangle(cornerRadius: 24)
                                    .fill(Color("primary300Color"))
                                    .frame(width: 280, height: 134)
                                    .padding(10)
                                    .overlay(
                                        Text("This is the \(index)th page here")
                                            .foregroundColor(.white)
                                    )
                            }
                        }
                    }
                    
                    VStack {
                        HStack {
                            ServxTextView(text: "Category", fontStyle: "Poppins", fontSize: 18, fontColor: Color("greyscale900Color"), isBold: true, isItalic: false, textAlignment: .center)
                            
                            Spacer()
                            
                            ServxTextView(text: "View all", fontStyle: "Poppins", fontSize: 14, fontColor: Color("primary500Color"), isBold: false, isItalic: false, textAlignment: .center)
                        }
                        .padding(.horizontal, 20)
                        
                        LazyVGrid(columns: Array(repeating: GridItem(), count: itemsPerRow), spacing: 10) {
                            ForEach(ServxStaticData.serviceCategories, id: \.name) { category in
                                NavigationLink {
                                    SingleMainCategorySubCategoriesListView(category: category)
                                } label: {
                                    CategoryButton(categoryName: category.name)
                                }
                            }
                        }
                        .padding()
                    }
                    .onAppear {
                        visibleCategories = ServxStaticData.serviceCategories.map { $0.name }
                    }
                    
                    HStack {
                        ServxTextView(text: "Recommended Services", fontStyle: "Poppins", fontSize: 18, fontColor: Color("greyscale900Color"), isBold: true, isItalic: false, textAlignment: .center)
                        
                        Spacer()
                        
                        ServxTextView(text: "View all", fontStyle: "Poppins", fontSize: 14, fontColor: Color("primary500Color"), isBold: false, isItalic: false, textAlignment: .center)
                            .onTapGesture {
                                // TODO:
                            }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 32)
                    
                    
                    VStack {
//                        ForEach(viewModel.recommendedServiceProviderPosts) { post in
//                            ServicePostView(postServiceImage: "serviceImage", postServiceName: post.title, postServiceProvider: post.serviceProvider, postServiceReviewValue: post.rating, postServiceReviewCount: post.reviews, postServicePrice: post.price, postServiceId: post.id)
//                        }
                    }
                    
                }
            })
        }
    }
}

#Preview {
    MainBottomNavBar()
}

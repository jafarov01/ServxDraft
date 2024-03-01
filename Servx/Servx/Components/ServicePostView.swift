//
//  ServicePostView.swift
//  Servx
//
//  Created by Makhlug Jafarov on 29/10/2023.
//

import SwiftUI
import Firebase

struct ServicePostView: View {
    var postServiceImage: String // qus
    var postServiceName: String     // qus
    var postServiceProvider: UserModel
    var postServiceReviewValue: CGFloat
    var postServiceReviewCount: Int
    var postServicePrice: CGFloat
    var postServiceId: String
    
    @ObservedObject var viewModel = ServicePostViewViewModel()
    
    // Computed property to check if the service post is bookmarked
    var isBookmarked: Bool {
        AuthenticatedUser.shared.bookmarkedServices.contains(where: { $0.serviceProviderPostReferenceID == postServiceId })
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 24)
            .fill(.white)
            .frame(width: 342, height: 144)
            .shadow(color: .black.opacity(0.1), radius: 30, x: 0, y: 4)
            .overlay(
                HStack {
                    Image(postServiceImage)
                        .resizable()
                        .frame(width: 120, height: 120)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            ServxTextView(text: postServiceName, fontStyle: "Poppins", fontSize: 18, fontColor: Color("greyscale900Color"), isBold: true, isItalic: false, textAlignment: .center)
                            
                            Spacer()
                            
                            if isBookmarked {
                                Image("bookmarkActiveIcon")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .onTapGesture {
                                        viewModel.toggleBookmark(for: postServiceId, isBookmarked: isBookmarked)
                                    }
                            } else {
                                Image("bookmarkIcon")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .onTapGesture {
                                        viewModel.toggleBookmark(for: postServiceId, isBookmarked: isBookmarked)
                                    }
                            }
                        }
                        
                        ServxTextView(text: postServiceProvider.fullname, fontStyle: "Poppins", fontSize: 15, fontColor: Color("greyscale700Color"), isBold: false, isItalic: false, textAlignment: .center)
                        
                        HStack {
                            Image("reviewIcon")
                                .frame(width: 16, height: 16)
                            Text(String(format: "%.1f", postServiceReviewValue))
                            Text("|")
                            Text("\(Int(postServiceReviewCount)) reviews")
                        }
                        
                        HStack {
                            ServxTextView(text: "$" + String(format: "%.0f", postServicePrice), fontStyle: "Poppins", fontSize: 16, fontColor: Color("primary500Color"), isBold: true, isItalic: false, textAlignment: .center)
                            
                            Spacer()
                            
                            ServxButtonView(height: 20, width: 65, handler: {}, label: "Add", textColor: .white, backgroundColor: Color("primary500Color"))
                        }
                    }
                }
                    .padding(12)
            )
    }
}

struct ServiceProviderPost_Previews: PreviewProvider {
    static var previews: some View {
        ServicePostView(postServiceImage: "sadad", postServiceName: "postServiceName", postServiceProvider: UserModel(id: "ID", fullName: "Makhlug Jafarov", phoneNumber: "1231312312", email: "makhlug@gmail.com", photoURL: "photoURL", address: Address(state: "state", address: "address", zipCode: "zipCode"), isCustomerOnly: false, createdAt: Timestamp()), postServiceReviewValue: 4.5, postServiceReviewCount: 9292, postServicePrice: 20, postServiceId: "11111", viewModel: ServicePostViewViewModel())
    }
}

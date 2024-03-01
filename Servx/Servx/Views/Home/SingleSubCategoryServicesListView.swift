//
//  SingleSubCategoryServicesListView.swift
//  Servx
//
//  Created by Makhlug Jafarov on 11/11/2023.
//

import SwiftUI

struct SingleSubCategoryServicesListView: View {
    @State var filterInput: String = ""
    var serviceCategory: ServiceCategory
    var serviceSubcategory: ServiceSubcategory
    @ObservedObject var viewModel: SingleSubCategoryServicesListViewViewModel

    init(serviceCategory: ServiceCategory, serviceSubcategory: ServiceSubcategory) {
        self.serviceCategory = serviceCategory
        self.serviceSubcategory = serviceSubcategory
        self.viewModel = SingleSubCategoryServicesListViewViewModel(
            serviceCategory: serviceCategory,
            serviceSubcategory: serviceSubcategory
        )
    }

    var body: some View {
        ScrollView {
            ServxInputView(text: $filterInput, placeholder: "What's the problem?", isSecure: false, frameColor: Color("greyscale400Color"), backgroundColor: Color("greyscale100Color"), textColor: Color("greyscale900Color"))
                .padding(.top, 20)

            ForEach(viewModel.serviceProviderPosts) { post in
                ServicePostView(
                    postServiceImage: "turanImage",
                    postServiceName: post.title,
                    postServiceProvider: post.provider,
                    postServiceReviewValue: post.rating,
                    postServiceReviewCount: post.reviews,
                    postServicePrice: post.price,
                    postServiceId: post.id
                )
            }


        }
        .onAppear(){
            if viewModel.serviceProviderPosts.isEmpty {
                print("MEX serviceProviderPosts is empty")
            } else {
                print("MEX serviceProviderPosts is NOT empty")
            }
        }
        .navigationTitle(serviceSubcategory.name)
    }
}

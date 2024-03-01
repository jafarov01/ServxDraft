//
//  SingleSubCategoryServicesListViewViewModel.swift
//  Servx
//
//  Created by Makhlug Jafarov on 07/12/2023.
//

import Foundation
import SwiftUI
import Firebase

@MainActor
class SingleSubCategoryServicesListViewViewModel: ObservableObject {
    @Published var serviceProviderPosts = [ServiceProviderPost]()
    
    var serviceCategory: ServiceCategory
    var serviceSubcategory: ServiceSubcategory

    init(serviceCategory: ServiceCategory, serviceSubcategory: ServiceSubcategory) {
        self.serviceCategory = serviceCategory
        self.serviceSubcategory = serviceSubcategory
        
        
    }
    
}

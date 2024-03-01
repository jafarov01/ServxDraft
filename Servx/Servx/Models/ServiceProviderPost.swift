//
//  ServiceProviderPost.swift
//  Servx
//
//  Created by Makhlug Jafarov on 11/11/2023.
//

import Foundation
import Firebase

struct ServiceProviderPost: Identifiable, Codable {
    var id: String
    var provider: UserModel
    var email: String
    var selectedServiceArea: String
    var photoURL: String
    var title: String
    var rating: CGFloat
    var reviews: Int
    var price: CGFloat
}


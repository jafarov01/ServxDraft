//
//  AuthenticatedUser.swift
//  Servx
//
//  Created by Makhlug Jafarov on 28/11/2023.
//

import Foundation
import Firebase
import SwiftUI

class AuthenticatedUser: ObservableObject, Codable {
    static let shared = AuthenticatedUser()
    
    var id: String = ""
    var fullname: String = ""
    var phoneNumber: String = ""
    var email: String = ""
    var password: String = ""
    var photoURL: String = ""
    var address: Address = Address(state: "", address: "", zipCode: "")
    var isCustomerOnly: Bool = false
    var createdAt: Timestamp? = nil
    var bookedServices: [Booking] = []
    var bookmarkedServices: [Bookmark] = []
    var selectedEducation: String = ""
    var selectedLanguage: String = ""
    var selectedServiceArea: String = ""
    var selectedServiceSubcategory : String = ""
    var selectedWorkExperience: String = ""
    
    @Published var uiImage = UIImage(named: "profileIconImage")!
    
    private init() {}
    
    enum CodingKeys: String, CodingKey {
        case id, fullname, phoneNumber, email, password, photoURL, address, isCustomerOnly, createdAt, bookedServices, bookmarkedServices, selectedEducation, selectedLanguage, selectedServiceArea, selectedServiceSubcategory, selectedWorkExperience
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        fullname = try container.decode(String.self, forKey: .fullname)
        phoneNumber = try container.decode(String.self, forKey: .phoneNumber)
        email = try container.decode(String.self, forKey: .email)
        password = try container.decode(String.self, forKey: .password)
        photoURL = try container.decode(String.self, forKey: .photoURL)
        address = try container.decode(Address.self, forKey: .address)
        isCustomerOnly = try container.decode(Bool.self, forKey: .isCustomerOnly)
        
        selectedEducation = try container.decode(String.self, forKey: .selectedEducation)
        selectedLanguage = try container.decode(String.self, forKey: .selectedLanguage)
        selectedServiceArea = try container.decode(String.self, forKey: .selectedServiceArea)
        selectedServiceSubcategory = try container.decode(String.self, forKey: .selectedServiceSubcategory)
        selectedWorkExperience = try container.decode(String.self, forKey: .selectedWorkExperience)
        
        createdAt = try container.decode(Timestamp.self, forKey: .createdAt)
        
        bookedServices = try container.decode([Booking].self, forKey: .bookedServices)
        bookmarkedServices = try container.decode([Bookmark].self, forKey: .bookmarkedServices)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(fullname, forKey: .fullname)
        try container.encode(phoneNumber, forKey: .phoneNumber)
        try container.encode(email, forKey: .email)
        try container.encode(password, forKey: .password)
        try container.encode(photoURL, forKey: .photoURL)
        try container.encode(address, forKey: .address)
        try container.encode(isCustomerOnly, forKey: .isCustomerOnly)
        
        try container.encode(selectedEducation, forKey: .selectedEducation)
        try container.encode(selectedLanguage, forKey: .selectedLanguage)
        try container.encode(selectedServiceArea, forKey: .selectedServiceArea)
        try container.encode(selectedServiceSubcategory, forKey: .selectedServiceSubcategory)
        try container.encode(selectedWorkExperience, forKey: .selectedWorkExperience)
        
        try container.encode(createdAt, forKey: .createdAt)
        
        try container.encodeIfPresent(bookedServices, forKey: .bookedServices)
        try container.encodeIfPresent(bookmarkedServices, forKey: .bookmarkedServices)
    }
}

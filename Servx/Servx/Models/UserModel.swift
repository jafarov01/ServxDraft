//
//  UserModel.swift
//  Servx
//
//  Created by Makhlug Jafarov on 23/10/2023.
//

import FirebaseFirestoreSwift
import Firebase

class UserModel: Codable {
    var id: String
    var fullname: String
    var phoneNumber: String
    var email: String
    var photoURL: String
    var address: Address
    var isCustomerOnly: Bool
    var createdAt: Timestamp
    
    init(id: String, fullName: String, phoneNumber: String, email: String, photoURL: String, address: Address, isCustomerOnly: Bool, createdAt: Timestamp) {
        self.id = id
        self.fullname = fullName
        self.phoneNumber = phoneNumber
        self.email = email
        self.photoURL = photoURL
        self.address = address
        self.isCustomerOnly = isCustomerOnly
        self.createdAt = createdAt
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case fullname
        case phoneNumber
        case email
        case photoURL
        case address
        case isCustomerOnly
        case createdAt
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
        fullname = try container.decode(String.self, forKey: .fullname)
        phoneNumber = try container.decode(String.self, forKey: .phoneNumber)
        email = try container.decode(String.self, forKey: .email)
        photoURL = try container.decode(String.self, forKey: .photoURL)
        address = try container.decode(Address.self, forKey: .address)
        isCustomerOnly = try container.decode(Bool.self, forKey: .isCustomerOnly)
        createdAt = try container.decode(Timestamp.self, forKey: .createdAt)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(id, forKey: .id)
        try container.encode(fullname, forKey: .fullname)
        try container.encode(phoneNumber, forKey: .phoneNumber)
        try container.encode(email, forKey: .email)
        try container.encode(photoURL, forKey: .photoURL)
        try container.encode(address, forKey: .address)
        try container.encode(isCustomerOnly, forKey: .isCustomerOnly)
        try container.encode(createdAt, forKey: .createdAt)
    }
}

//
//  Booking.swift
//  Servx
//
//  Created by Makhlug Jafarov on 11/12/2023.
//

import Foundation
import Firebase

final class Booking: Codable {
    var id: String
    var serviceProvider: UserModel
    var serviceSeeker: UserModel
    var date: Timestamp
    var location: String
    var status: Booking.Status
    var agreedPrice: CGFloat
    var servicePost: ServiceProviderPost
    
    enum Status: String, Codable {
        case ongoing = "ongoing"
        case cancelled = "cancelled"
        case postponed = "postponed"
        case completed = "completed"
    }
    
    enum CodingKeys: String, CodingKey {
        case serviceProvider
        case serviceSeeker
        case date
        case location
        case status
        case agreedPrice = "agreed_price"
        case id
        case servicePost
    }
    
    init(id: String, serviceProvider: UserModel, serviceSeeker: UserModel, date: Timestamp, location: String, status: Booking.Status, agreedPrice: CGFloat, servicePost: ServiceProviderPost) {
        self.id = id
        self.serviceProvider = serviceProvider
        self.serviceSeeker = serviceSeeker
        self.date = date
        self.location = location
        self.status = status
        self.agreedPrice = agreedPrice
        self.servicePost = servicePost
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
        serviceProvider = try container.decode(UserModel.self, forKey: .serviceProvider)
        serviceSeeker = try container.decode(UserModel.self, forKey: .serviceSeeker)
        date = try container.decode(Timestamp.self, forKey: .date)
        location = try container.decode(String.self, forKey: .location)
        status = try container.decode(Booking.Status.self, forKey: .status)
        agreedPrice = try container.decode(CGFloat.self, forKey: .agreedPrice)
        servicePost = try container.decode(ServiceProviderPost.self, forKey: .servicePost)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(id, forKey: .id)
        try container.encode(serviceProvider, forKey: .serviceProvider)
        try container.encode(serviceSeeker, forKey: .serviceSeeker)
        try container.encode(date, forKey: .date)
        try container.encode(location, forKey: .location)
        try container.encode(status, forKey: .status)
        try container.encode(agreedPrice, forKey: .agreedPrice)
        try container.encode(servicePost, forKey: .servicePost)
    }
    
    var ServiceProvider: UserModel {
        get {
            return serviceProvider
        }
    }
    
    var ServiceSeeker: UserModel {
        get {
            return serviceSeeker
        }
    }
    
    var Date: Timestamp {
        get {
            return date
        }
    }
    
    var Location: String {
        get {
            return location
        }
    }
    
    var StatusAsString: String {
        get {
            return status.rawValue
        }
    }
    
    var Status: Status {
        get {
            return status
        }
    }
    
    var AgreedPrice: CGFloat {
        get {
            return agreedPrice
        }
    }
    
    var ID: String {
        get {
            return id
        }
    }
    
    var ServicePost: ServiceProviderPost {
        get {
            return servicePost
        }
    }

}

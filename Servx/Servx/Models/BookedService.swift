//
//  BookedService.swift
//  Servx
//
//  Created by Makhlug Jafarov on 07/12/2023.
//

import Foundation
import Firebase

struct BookedService: Codable {
    private var serviceProvider: UserModel
    private var serviceSeeker: UserModel
    private var date: Timestamp
    private var location: String
    private var status: BookedService.Status
    private var agreedPrice: CGFloat
    
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
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        serviceProvider = try container.decode(UserModel.self, forKey: .serviceProvider)
        serviceSeeker = try container.decode(UserModel.self, forKey: .serviceSeeker)
        date = try container.decode(Timestamp.self, forKey: .date)
        location = try container.decode(String.self, forKey: .location)
        status = try container.decode(Status.self, forKey: .status)
        agreedPrice = try container.decode(CGFloat.self, forKey: .agreedPrice)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(serviceProvider, forKey: .serviceProvider)
        try container.encode(serviceSeeker, forKey: .serviceSeeker)
        try container.encode(date, forKey: .date)
        try container.encode(location, forKey: .location)
        try container.encode(status, forKey: .status)
        try container.encode(agreedPrice, forKey: .agreedPrice)
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

    var AgreedPrice: CGFloat {
        get {
            return agreedPrice
        }
    }
}

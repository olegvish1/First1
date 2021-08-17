//
//  User.swift
//  First1
//
//  Created by Oleg Vishnivetskiy on 14.08.2021.
//

import Foundation

struct User: Codable {
    var firstName: String
    var picture: String
    var lastName: String
    var city: String
    var birthdate: TimeInterval

    enum CodingKeys: String, CodingKey {
        case firstName // = "first_name"
        case picture
        case lastName // = "last_name"
        case location
        case birthdate
    }

    enum LocationCodingKeys: String, CodingKey {
        case city
    }

    init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.firstName = try container.decode(String.self, forKey: .firstName)
        self.picture = try container.decode(String.self, forKey: .picture)
        self.lastName = try container.decode(String.self, forKey: .lastName)
        self.birthdate = try container.decode(TimeInterval.self, forKey: .birthdate)

        // Nested ratings
        let locationContainer = try container.nestedContainer(keyedBy: LocationCodingKeys.self, forKey: .location)
        self.city = try locationContainer.decode(String.self, forKey: .city)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(firstName, forKey: .firstName)
        try container.encode(picture, forKey: .picture)
        try container.encode(lastName, forKey: .lastName)

        var locationContainer = container.nestedContainer(keyedBy: LocationCodingKeys.self, forKey: .location)
        try locationContainer.encode(city, forKey: .city)
    }
}

//struct Adress: Decodable {
//    var city: String
//}

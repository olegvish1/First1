//
//  User.swift
//  First1
//
//  Created by Oleg Vishnivetskiy on 08.05.2021.
//

import Foundation

struct User: Decodable {
    let firstName: String
    let picture: String?
    let lastName: String
    let address: Address

    enum CodingKeys: String, CodingKey {
        case firstName
        case picture
        case lastName
        case address = "location"
    }
}

struct Address: Decodable {
    let city: String
}

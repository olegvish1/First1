//
//  UsersFactory.swift
//  First1
//
//  Created by Oleg Vishnivetskiy on 16.08.2021.
//


import UIKit

final class UsersFactory {

    var appDelegate = UIApplication.shared.delegate

    static func getUsers() -> [User] {

        if let path = Bundle.main.path(forResource: "users", ofType: "json") {

            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)

                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let users: [User] = try decoder.decode([User].self, from: data)

                return users
            } catch {
                print(error)
                // handle error
                return []
            }
        }

        return []
    }

    func saveUser(user: User) {
        
    }
}

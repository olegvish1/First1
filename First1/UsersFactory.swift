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

        let usersFromDB = self.fetchUsers()
        if !usersFromDB.isEmpty {
            return usersFromDB
        }

        if let path = Bundle.main.path(forResource: "users", ofType: "json") {

            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)

                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let users: [User] = try decoder.decode([User].self, from: data)

                Self.saveUsers(users: users)

                return users
            } catch {
                print(error)
                // handle error
                return []
            }
        }

        return []
    }

    static func saveUsers(users: [User]) {
        DataStorage().save(users: users)
    }

    static func fetchUsers() -> [User] {
        DataStorage().fetchUsers()
    }
}

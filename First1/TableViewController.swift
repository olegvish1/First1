//
//  TableViewController.swift
//  First1
//
//  Created by Oleg Vishnivetskiy on 04.05.2021.
//

import UIKit

struct User: Codable {
    var firstName: String
    var picture: String
    var lastName: String
    var city: String

    enum CodingKeys: String, CodingKey {
        case firstName // = "first_name"
        case picture
        case lastName // = "last_name"
        case location
    }

    enum LocationCodingKeys: String, CodingKey {
        case city
    }

    init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.firstName = try container.decode(String.self, forKey: .firstName)
        self.picture = try container.decode(String.self, forKey: .picture)
        self.lastName = try container.decode(String.self, forKey: .lastName)

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

class TableViewController: UIViewController {

    @IBOutlet var tableView: UITableView!

    var users: [User]?

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self

//        createData()
    }

    func createData() {
//        let image = #imageLiteral(resourceName: "catAvatar")
//        let image2 = UIImage(named:"women/38.jpg")
//        users = [User(firstName: "Name", picture: "catAvatar", lastName: "description"),
//                 User(firstName: "Name", picture: "catAvatar", lastName: "description"),
//                 User(firstName: "Name", picture: "women/38.jpg", lastName: "description"),
//                 User(firstName: "Name", picture: "women/38.jpg", lastName: "description")]
    }
}

// MARK: - UITableViewDataSource

extension TableViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCellID", for: indexPath) as! MyTableViewCell

        if let user = users?[indexPath.row] {

            cell.setup(user)
        }
        return cell
    }
}

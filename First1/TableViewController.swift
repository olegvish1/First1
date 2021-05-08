//
//  TableViewController.swift
//  First1
//
//  Created by Oleg Vishnivetskiy on 04.05.2021.
//

import UIKit

struct User: Decodable {
    var firstName: String
    var picture: String
    var lastName: String
    var address: Adress

    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case picture
        case lastName = "last_name"
        case address = "location"
    }
}

struct Adress: Decodable {
    var city: String
}

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

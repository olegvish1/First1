//
//  TableViewController.swift
//  First1
//
//  Created by Oleg Vishnivetskiy on 04.05.2021.
//

import UIKit

struct User: Decodable {
    var first_name: String
    var picture: String
    var last_name: String
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
        users = [User(first_name: "Name", picture: "catAvatar", last_name: "description"),
                 User(first_name: "Name", picture: "catAvatar", last_name: "description"),
                 User(first_name: "Name", picture: "women/38.jpg", last_name: "description"),
                 User(first_name: "Name", picture: "women/38.jpg", last_name: "description")]
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

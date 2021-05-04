//
//  TableViewController.swift
//  First1
//
//  Created by Oleg Vishnivetskiy on 04.05.2021.
//

import UIKit

struct User {
    let name: String
    let avatar: UIImage?
    let description: String
}

class TableViewController: UIViewController {

    @IBOutlet var tableView: UITableView!

    var users: [User]?

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self

        createData()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func createData() {
        let image = #imageLiteral(resourceName: "catAvatar")
        let image2 = UIImage(named:"catAvatar")
        users = [User(name: "Name", avatar: image, description: "description"),
                 User(name: "Name", avatar: image, description: "description"),
                 User(name: "Name", avatar: image2, description: "description"),
                 User(name: "Name", avatar: image2, description: "description")]
    }
}

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

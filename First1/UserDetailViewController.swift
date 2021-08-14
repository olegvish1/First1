//
//  UserDetailViewController.swift
//  First1
//
//  Created by Oleg Vishnivetskiy on 03.08.2021.
//

import UIKit

class UserDetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var birthdayLabel: UILabel!

    private var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }

    @discardableResult
    func with(_ user: User) -> Self {

        self.user = user
        
        return self
    }

}

private extension UserDetailViewController {

    func configure() {
        nameLabel.text = user.firstName
        imageView.image = UIImage.init(named: user.picture)

        birthdayLabel.text = makeBirthday()
    }

    func makeBirthday() -> String {

        let date = Date(timeIntervalSince1970: user.birthdate)

        let formatter = DateFormatter.init()
        formatter.dateStyle = .short
        formatter.timeStyle = .short

        formatter.dateFormat = "MM/dd/yyyy"

        return formatter.string(from: date)
    }
}

//
//  MyTableViewCell.swift
//  First1
//
//  Created by Oleg Vishnivetskiy on 04.05.2021.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet private var myImageView: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        myImageView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override func prepareForReuse() {
        super.prepareForReuse()

    }

    func setup(_ user: User) {
        titleLabel.text = user.firstName
        descriptionLabel.text = user.lastName
        myImageView.image = UIImage(named: user.picture)

        let userData = try! JSONEncoder().encode(user)
        let userString = String(data: userData, encoding: .utf8)!
        print(userData)
        print(userString)
    }
}

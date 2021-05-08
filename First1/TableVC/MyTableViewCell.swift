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
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override func prepareForReuse() {
        myImageView.image = nil
    }

    func setup(_ user: User) {
        titleLabel.text = user.firstName
        descriptionLabel.text = user.lastName
        if let picture = user.picture {
            myImageView.image = UIImage(named: picture)
        }
    }

}

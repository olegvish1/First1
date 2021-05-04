//
//  MyTableViewCell.swift
//  First1
//
//  Created by Oleg Vishnivetskiy on 04.05.2021.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet var myImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

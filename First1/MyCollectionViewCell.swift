//
//  MyCollectionViewCell.swift
//  First1
//
//  Created by Oleg Vishnivetskiy on 03.08.2021.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {

    @IBOutlet var imageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()

        imageView.layer.cornerRadius = 10
    }
}

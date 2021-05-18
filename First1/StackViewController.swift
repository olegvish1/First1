//
//  StackViewController.swift
//  First1
//
//  Created by Oleg Vishnivetskiy on 18.05.2021.
//

import UIKit

class StackViewController: UIViewController {

    @IBOutlet var stackView: UIStackView!
    @IBOutlet var orangeView: UIView!
    @IBOutlet var purpleView: UIView!
    @IBOutlet var lightBlueView: UIView!
    @IBOutlet var greenView: UIView!
    @IBOutlet var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func hideShowPurple(_ sender: UIButton) {
        sender.isSelected.toggle()
        purpleView.isHidden = sender.isSelected
    }

    @IBAction func hideShowOrange(_ sender: UIButton) {
        sender.isSelected.toggle()
        orangeView.isHidden = sender.isSelected
    }

    @IBAction func hideShowGreen(_ sender: UIButton) {
        sender.isSelected.toggle()
        lightBlueView.isHidden = sender.isSelected
    }

    @IBAction func addFirstView() {
//        let newView = UIView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 100, height: 50)))

//        newView.translatesAutoresizingMaskIntoConstraints = false
//
//        newView.backgroundColor = .brown
//
//        NSLayoutConstraint.activate([
//            newView.heightAnchor.constraint(equalToConstant: 50)
//        ])

//        stackView.addArrangedSubview(newView)
//        stackView.insertSubview(newView, at: 1)

        label.text = "addArrangedSubview addArrangedSubview addArrangedSubview addArrangedSubview addArrangedSubview addArrangedSubview addArrangedSubview addArrangedSubview addArrangedSubview addArrangedSubview addArrangedSubview"
    }
}

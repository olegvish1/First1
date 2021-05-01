//
//  SliderViewController.swift
//  First1
//
//  Created by Oleg Vishnivetskiy on 23.04.2021.
//

import UIKit

protocol SliderViewControllerDelegate: AnyObject {
    func buttonTapped()
}

class SliderViewController: UIViewController {

    @IBOutlet var contentView: UIView!
    @IBOutlet var slider: UISlider!
    @IBOutlet var coverView: UIView!
    @IBOutlet var shadowSwitch: UISwitch!

    weak var delegate: SliderViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Slider"

        setupContentView()

        coverView.clipsToBounds = true
        coverView.layer.cornerRadius = 15

        coverView.alpha = CGFloat(slider.value)
        contentView.clipsToBounds = shadowSwitch.isOn
    }

    @IBAction func sliderAction(_ sender: UISlider) {
        coverView.alpha = CGFloat(sender.value)
    }

    @IBAction func changeColors() {

        slider.thumbTintColor = UIColor.init(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        let leftColor: UIColor = .green
        let rightColor = UIColor.myRedColor

        slider.minimumTrackTintColor = leftColor
        slider.maximumTrackTintColor = rightColor

        contentView.backgroundColor = leftColor
        coverView.backgroundColor = rightColor

        delegate?.buttonTapped()
    }

    @IBAction func switchAction(_ sender: UISwitch) {
        contentView.clipsToBounds = sender.isOn
    }
}

extension SliderViewController {

    func setupContentView() {

        contentView.layer.cornerRadius = 15

        addShadow()
    }
    func addShadow() {
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 10)
        contentView.layer.shadowRadius = 15
        contentView.layer.shadowOpacity = 0.5
    }
}

extension UIColor {

    static var myRedColor: UIColor {
        return UIColor.init(red: 1, green: 0.336, blue: 0.071, alpha: 1)
    }
}

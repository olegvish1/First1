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
    @IBOutlet var imageView: UIImageView!

    weak var delegate: SliderViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Slider"

        setupContentView()

        coverView.clipsToBounds = true
        coverView.layer.cornerRadius = 15

        coverView.alpha = CGFloat(slider.value)
        contentView.clipsToBounds = shadowSwitch.isOn

        createGradientLayer()
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

        UIView.animate(
            withDuration: 2.0,
            delay: 0,
            options: .curveEaseOut,
            animations: { [weak self] in

                self?.imageView.alpha = sender.isOn ? 1 : 0
        })
    }
}

extension SliderViewController {

    func setupContentView() {

        contentView.layer.cornerRadius = 15
        contentView.clipsToBounds = false

        addShadow()
    }
    func addShadow() {
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = .zero
        contentView.layer.shadowRadius = 15
        contentView.layer.shadowOpacity = 1
    }

    func createGradientLayer() {
        let gradientLayer = CAGradientLayer()

        gradientLayer.frame = coverView.bounds
        gradientLayer.startPoint = CGPoint(x: 0.3, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.7, y: 1)

        gradientLayer.type = .radial

        gradientLayer.colors = [
            UIColor.red.cgColor,
            UIColor.green.cgColor,
            UIColor.blue.cgColor
        ]

        coverView.layer.insertSublayer(gradientLayer, at: 0)
    }
}

extension UIColor {

    static var myRedColor: UIColor {
        return UIColor.init(red: 1, green: 0.336, blue: 0.071, alpha: 1)
    }
}

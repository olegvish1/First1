//
//  ViewController.swift
//  First1
//
//  Created by Oleg Vishnivetskiy on 17.04.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myButton: UIButton!
    @IBOutlet var myLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapAction() {
        myLabel.text = "Button tapped"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "slider",
           let destination = segue.destination as? SliderViewController {
                destination.delegate = self
        }
    }
}


extension ViewController: SliderViewControllerDelegate {

    func buttonTapped() {

        myLabel.text = "SliderViewControllerDelegate buttonTapped"
    }
}


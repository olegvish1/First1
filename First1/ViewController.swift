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
        showAlert()
    }

    func showAlert() {
        if let navigation = navigationController {
            let alert = UIAlertController.init(
                title: "Button Tapped",
                message: "SliderViewControllerDelegate Button Tapped",
                preferredStyle: .alert)


            let goAction = UIAlertAction(
                title: "SliderViewControllerDelegate Go",
                style: .default,
                handler: { _ in
                    print("GO button tapped")
                    // open screen
                    // Analytic.trackEvent
                })

            let okAction = UIAlertAction(title: "OK", style: .cancel)

            let deleteAction = UIAlertAction(
                title: "Delete",
                style: .destructive,
                handler: { _ in
                    print("Delete button tapped")
                    // Delete samething
                })

            alert.addAction(goAction)
            alert.addAction(okAction)
            alert.addAction(deleteAction)

            navigation.present(alert, animated: true)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "slider",
           let destination = segue.destination as? SliderViewController {
//                destination.delegate = self
        }
    }
}


//extension ViewController: SliderViewControllerDelegate {
//
//    func buttonTapped() {
//
//        myLabel.text = "SliderViewControllerDelegate buttonTapped"
//    }
//}


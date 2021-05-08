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

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        showTableVC()
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
                destination.delegate = self
        }
    }
}


extension ViewController: SliderViewControllerDelegate {

    func buttonTapped() {

        myLabel.text = "SliderViewControllerDelegate buttonTapped"
    }

    func showTableVC() {
        // Create a reference to the the appropriate storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        // Instantiate the desired view controller from the storyboard using the view controllers identifier
        // Cast is as the custom view controller type you created in order to access it's properties and methods
        if let vc = storyboard.instantiateViewController(withIdentifier: "TableViewController") as? TableViewController {

            let users = getUsersList()
            vc.users = users

            navigationController?.pushViewController(vc, animated: true)
        }
    }

    func getUsersList() -> [User] {

        if let path = Bundle.main.path(forResource: "users", ofType: "json") {

            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)

                let users: [User] = try JSONDecoder().decode([User].self, from: data)

//                if let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? Array<Dictionary<String, AnyObject>> {
//                    print(jsonResult)
//                    for object in jsonResult {
//
//                    }
//                }

                return users
            } catch {
                print(error)
                // handle error

                return []
            }
        }

        return []
    }
}


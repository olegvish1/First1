//
//  TextFieldViewController.swift
//  First1
//
//  Created by Oleg Vishnivetskiy on 20.04.2021.
//

import UIKit

class TextFieldViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Purple"
        loginTextField.delegate = self
        passTextField.delegate = self


        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        loginTextField.becomeFirstResponder()

    }

    @IBAction func textChanged(_ sender: UITextField) {
        print(sender.text ?? "")
    }

//    akdvavasdfvasdnvdfva jdk fnskv?

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        if textField == loginTextField {
            passTextField.becomeFirstResponder()
        } else {
            passTextField.resignFirstResponder()
        }

        return true
    }

    @IBAction func passEditing(_ sender: UITextField) {
        print(sender.text ?? "")
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(textField.text ?? "")
        print(range)
        print(string)

        if string == "r" {
            return false
        }

        guard
            let text = textField.text,
            let textRange = Range(range, in: text)
        else { return false }

        let updatedText = text.replacingCharacters(in: textRange, with: string)

        if updatedText.count > 5 {
            return false
        }

        return true
    }
}

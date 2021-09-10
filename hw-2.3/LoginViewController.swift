//
//  ViewController.swift
//  hw-2.3
//
//  Created by Vahtee Boo on 10.09.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    private let usernameCode = "username22"
    private let passwordCode = "password33"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.username = usernameTF.text
    }
    
    @IBAction func loginButtonPressed() {
        guard usernameTF.text == usernameCode && passwordTF.text == passwordCode else {
            showAlert(with: "Wrong username or password", and: "Please, enter correct name and password")
            passwordTF.text = ""
            return
        }
    }
    
    @IBAction func usernameHelpButton() {
        showAlert(with: "Forgot Your Username?", and: "Use: \(usernameCode)")
    }
    
    @IBAction func passwordHelpButton() {
        showAlert(with: "Forgot Your Password?", and: "Use: \(passwordCode)")
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        usernameTF.text = nil
        passwordTF.text = nil
    }
}

extension LoginViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        if textField == usernameTF {
//            passwordTF.becomeFirstResponder()
//        } else {
//            logInPressed()
//        }
//        return true
//    }
}

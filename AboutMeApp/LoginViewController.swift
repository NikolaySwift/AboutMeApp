//
//  ViewController.swift
//  AboutMeApp
//
//  Created by NikolayD on 08.07.2024.
//

import UIKit

final class LoginViewController: UIViewController {

    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    private let correctUserName = "User"
    private let correctPassword = "1234"
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func forgotUserNameButtonTapped() {
        showAlert(
            WithTitle: "Oops!",
            AndMessage: "Your name is \(correctUserName)"
        )
    }
    
    @IBAction func forgotPasswordButtonTapped() {
        showAlert(
            WithTitle: "Oops!",
            AndMessage: "Your password is \(correctPassword)"
        )
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
}

extension LoginViewController {
    private func showAlert(WithTitle title: String, AndMessage message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension LoginViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let welcomeVC = segue.destination as? WelcomeViewController
        welcomeVC?.userName = userNameTF.text
    }
    
    override func shouldPerformSegue(
        withIdentifier identifier: String,
        sender: Any?
    ) -> Bool {
        guard let userName = userNameTF.text, let password = passwordTF.text else {
            return false
        }
        
        guard !userName.isEmpty, !password.isEmpty else {
            showAlert(
                WithTitle: "Invalid login or password",
                AndMessage: "please enter correct login and password"
            )
            return false
        }

        guard userName == correctUserName, password == correctPassword else {
            showAlert(
                WithTitle: "Invalid login or password",
                AndMessage: "please enter correct login and password"
            )
            return false
        }
        
        return true
    }
}

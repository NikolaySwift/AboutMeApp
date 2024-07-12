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
    
    private let user = User.getUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTF.text = user.userName
        passwordTF.text = user.password
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func tipButtonTapped(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(
            withTitle: "Oops!",
            andMessage: "Your name is \(user.userName)"
        )
        : showAlert(
            withTitle: "Oops!",
            andMessage: "Your password is \(user.password)"
        )
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
}

// MARK: - Alert Controller
extension LoginViewController {
    private func showAlert(
        withTitle title: String,
        andMessage message: String,
        completion: (() -> Void)? = nil
    ) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            completion?()
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - Segue Life Cycle
extension LoginViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarVC = segue.destination as? TabBarController else { return }
        guard let viewControllers = tabBarVC.viewControllers else { return }
        
        tabBarVC.personName = user.person.name
        
        viewControllers.forEach({ viewController in
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.userName = user.userName
                welcomeVC.personName = user.person.name
            } else if let navigationVC = viewController as? UINavigationController {
                if let aboutMeVC = navigationVC.topViewController as? AboutMeViewController {
                    aboutMeVC.person = user.person
                }
            }
        })
    }
    
    override func shouldPerformSegue(
        withIdentifier identifier: String,
        sender: Any?
    ) -> Bool {
        guard userNameTF.text == user.userName, passwordTF.text == user.password else {
            showAlert(
                withTitle: "Invalid login or password",
                andMessage: "please enter correct login and password") {
                    self.passwordTF.text = ""
                }
            return false
        }
        
        return true
    }
}

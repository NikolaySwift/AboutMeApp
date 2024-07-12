//
//  WelcomeViewController.swift
//  AboutMeApp
//
//  Created by NikolayD on 08.07.2024.
//

import UIKit

final class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var myNameLabel: UILabel!
    
    var userName: String!
    var personName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = "Добро пожаловать, \(userName ?? "")!"
        myNameLabel.text = "Меня зовут \(personName ?? "")"
    }
    
}

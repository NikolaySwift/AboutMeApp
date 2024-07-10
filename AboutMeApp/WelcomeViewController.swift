//
//  WelcomeViewController.swift
//  AboutMeApp
//
//  Created by NikolayD on 08.07.2024.
//

import UIKit

final class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = "Welcome, \(userName ?? "")!"
    }
    
}

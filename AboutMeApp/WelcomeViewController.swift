//
//  WelcomeViewController.swift
//  AboutMeApp
//
//  Created by NikolayD on 08.07.2024.
//

import UIKit

final class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var handWaveLabel: UILabel!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        handWaveLabel.text = "👋"
        welcomeLabel.text = "Welcome, \(userName ?? "")!"
    }
    
}

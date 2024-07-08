//
//  WelcomeViewController.swift
//  AboutMeApp
//
//  Created by NikolayD on 08.07.2024.
//

import UIKit

final class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var HandWaveLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func logoutButtonTapped() {
        dismiss(animated: true)
    }
    
}

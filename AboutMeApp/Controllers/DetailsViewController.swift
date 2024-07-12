//
//  DetailsViewController.swift
//  AboutMeApp
//
//  Created by NikolayD on 12.07.2024.
//

import UIKit

final class DetailsViewController: UIViewController {

    @IBOutlet var detailTitleNavigationItem: UINavigationItem!
    @IBOutlet var descriptionLabel: UILabel!
    
    @IBOutlet var backButton: UIButton!
    @IBOutlet var nextButton: UIButton!
    
    var details: [Detail]!
    private var detailIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButton()
        setText()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        detailIndex += sender == nextButton ? 1 : -1
        
        setupButton()
        setText()
    }
    
    private func setupButton() {
        backButton.isEnabled = detailIndex > 0
        nextButton.isEnabled = detailIndex + 1 < details.count
    }
    
    private func setText() {
        detailTitleNavigationItem.title = details[detailIndex].title
        descriptionLabel.text = details[detailIndex].description
    }
}

//
//  AboutMeViewController.swift
//  AboutMeApp
//
//  Created by NikolayD on 12.07.2024.
//

import UIKit

final class AboutMeViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var surnameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var hometownLabel: UILabel!
    @IBOutlet var photoImageView: UIImageView!
    
    @IBOutlet var moreDetailsButton: UIBarButtonItem!
    @IBOutlet var aboutMeNavigationItem: UINavigationItem!
    
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = person.name
        surnameLabel.text = person.surname
        ageLabel.text = person.age.formatted()
        hometownLabel.text = person.hometown
        if let photo = person.photo, let image = UIImage(named: photo) {
            photoImageView.image = UIImage(named: photo)
            photoImageView.layer.cornerRadius = photoImageView.frame.width / 2
        } else {
            photoImageView.isHidden.toggle()
        }
        
        aboutMeNavigationItem.title = "\(person.surname) \(person.name)"
        if person.details.isEmpty {
            moreDetailsButton.isHidden.toggle()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailsVC = segue.destination as? DetailsViewController else { return }
        
        detailsVC.details = person.details
    }
}

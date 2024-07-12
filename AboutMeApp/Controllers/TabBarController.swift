//
//  TabBarViewController.swift
//  AboutMeApp
//
//  Created by NikolayD on 12.07.2024.
//

import UIKit

class TabBarController: UITabBarController {

    var personName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBar.standardAppearance = tabBarAppearance
        tabBar.scrollEdgeAppearance = tabBarAppearance
        
        if let items = tabBar.items {
            items[1].title = personName
        }
    }
}

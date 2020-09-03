//
//  TabBarController.swift
//  BusinessSearch
//
//  Created by Aaron Peterson on 8/8/20.
//  Copyright © 2020 Aaron Peterson. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureTabBar()
    }
    
    
    func configureTabBar() {
        let businessesVC = BusinessesViewController()
        businessesVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        
        let userProfileVC = UserProfileViewController()
        userProfileVC.tabBarItem.image = UIImage(systemName: "person.fill")
        
        let favoritesVC = FavoritesViewController()
        favoritesVC.tabBarItem.image = UIImage(systemName: "star.fill")
        
        viewControllers = [businessesVC, favoritesVC, userProfileVC]
    }

}

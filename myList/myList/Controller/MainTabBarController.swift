//
//  ViewController.swift
//  myList
//
//  Created by Hy Horng on 11/17/20.
//  Copyright © 2020 Hy Horng. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.barTintColor = UIColor(red: 255/255, green: 246/255, blue: 243/255, alpha: 1)

        setupTabBar()
    }
    
    func setupTabBar() {
        
        let firstVC = UINavigationController(rootViewController: FirstViewController())
        firstVC.tabBarItem.image = UIImage(named: "Home")
        
        let secondVC = UINavigationController(rootViewController: SecondViewController())
        secondVC.tabBarItem.image = UIImage(named: "Categories")
        
        let thirdVC = UINavigationController(rootViewController: ThirdViewController())
        thirdVC.tabBarItem.image = UIImage(named: "Profile")
        
        let fourVC = UINavigationController(rootViewController: FourViewController())
        fourVC.tabBarItem.image = UIImage(named: "Notification")
        
        let fiveVC = UINavigationController(rootViewController: FiveViewController())
        fiveVC.tabBarItem.image = UIImage(named: "My List")
        
        viewControllers = [firstVC, secondVC, thirdVC, fourVC, fiveVC]
        
    }

}


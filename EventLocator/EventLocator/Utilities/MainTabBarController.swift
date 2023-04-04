//
//  MainTabBarController.swift
//  CoordinatorPatternExample
//
//  Created by Craig Clayton on 2/2/23.
//

import UIKit

class MainTabBarController: UITabBarController {
    enum TabBarType {
        case clear
        case normal
    }
    
    var _tabBarType: TabBarType = .normal {
        didSet {
            switch _tabBarType {
                case .clear:
                    tabBar.backgroundColor = .clear
                    tabBar.tintColor = .white
                    tabBar.barTintColor = .white
                    tabBar.backgroundImage = UIImage()
                    tabBar.barStyle = .black
                    tabBar.unselectedItemTintColor = .white
                case .normal:
                    tabBar.backgroundColor = .white
                    tabBar.tintColor = .black
                    tabBar.barTintColor = .black
                    tabBar.backgroundImage = UIImage()
                    tabBar.barStyle = .default
                    tabBarItem.badgeColor = .black
                    tabBar.unselectedItemTintColor = .black
            }
        }
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _tabBarType = .normal
        
    }
}

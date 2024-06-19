//
//  TabBarController.swift
//  FoodDelApp
//
//  Created by macbookbro on 19.06.2024.
//

import UIKit

class TabBarController: UITabBarController {
    
    init(tabBarControllers: [UIViewController]) {
        super.init(nibName: nil, bundle: nil)
        for tab in tabBarControllers {
            self.addChild(tab)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.backgroundColor  = AppColors.background_white
        tabBar.tintColor = AppColors.accentOrange
    }
    
}

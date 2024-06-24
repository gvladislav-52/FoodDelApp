//
//  OnboardingCoordinate.swift
//  FoodDelApp
//
//  Created by macbookbro on 19.06.2024.
//

import UIKit

class OnboardingCoordinator: Coordinator {
    override func start() {
        showOnboarding()
    }
    override func finish() {
        print("AppCoordinator finish")
    }
}

private extension OnboardingCoordinator {
    func showOnboarding() {
        var pages = [UIViewController]()
        let firstVC = OnboardingPartViewController()
        firstVC.imageToShow = UIImage(imageLiteralResourceName: "chicken-leg 1")
        firstVC.titleText = String("Delicious Food")
        firstVC.discriptionText = String("Lorem ipsum dolor sit amet, consectetur adipiscing edit.")
        
        let secondVC = OnboardingPartViewController()
        secondVC.imageToShow = UIImage(imageLiteralResourceName: "credit-card 1")
        secondVC.titleText = String("Fast Shipping")
        secondVC.discriptionText = String("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Interdum rhoncus nulla.")
        
        let thirdVC = OnboardingPartViewController()
        thirdVC.imageToShow = UIImage(imageLiteralResourceName: "medal 1")
        thirdVC.titleText = String("Certificate Food")
        thirdVC.discriptionText = String("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ultricies mauris a id.")
        
        let fourVC = OnboardingPartViewController()
        fourVC.imageToShow = UIImage(imageLiteralResourceName: "credit-card 1")
        fourVC.titleText = String("Payment Online")
        fourVC.discriptionText = String("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dui ultricies sit massa.")
        
        pages.append(firstVC)
        pages.append(secondVC)
        pages.append(thirdVC)
        pages.append(fourVC)
        
        let presenter = OnboardingViewPresenter(coordinator: self)
        let viewController = OnboardingViewController(pages: pages, viewOutput: presenter)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

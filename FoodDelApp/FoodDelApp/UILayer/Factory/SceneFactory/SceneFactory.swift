//
//  SceneFactory.swift
//  FoodDelApp
//
//  Created by macbookbro on 26.06.2024.
//

import UIKit

struct SceneFactory {
    
    //MARK: - Onboarding flow
    static func makeOnboardingFlow(finishDelegate: CoordinatorFinishDelegate, navigationController: UINavigationController, coordinator: AppCoordinator) {
        let onboardingCoordinator = OnboardingCoordinator(type: .onboarding, navigationController: navigationController, finishDelegate: finishDelegate)
        coordinator.addChildCoordinator(onboardingCoordinator)
        onboardingCoordinator.start()
    }
    static func makeOnboardingScene(coordinator: OnboardingCoordinator) -> OnboardingViewController {
        var pages = [OnboardingPartViewController]()
        let firstVC = OnboardingPartViewController()
        firstVC.imageToShow = UIImage(imageLiteralResourceName: "chicken-leg 1")
        firstVC.titleText = String("Delicious Food")
        firstVC.discriptionText = String("Lorem ipsum dolor sit amet, consectetur adipiscing edit.")
        firstVC.buttonText = String("Next")
        
        let secondVC = OnboardingPartViewController()
        secondVC.imageToShow = UIImage(imageLiteralResourceName: "credit-card 1")
        secondVC.titleText = String("Fast Shipping")
        secondVC.discriptionText = String("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Interdum rhoncus nulla.")
        secondVC.buttonText = String("Next")
        
        let thirdVC = OnboardingPartViewController()
        thirdVC.imageToShow = UIImage(imageLiteralResourceName: "medal 1")
        thirdVC.titleText = String("Certificate Food")
        thirdVC.discriptionText = String("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ultricies mauris a id.")
        thirdVC.buttonText = String("Next")
        
        let fourVC = OnboardingPartViewController()
        fourVC.imageToShow = UIImage(imageLiteralResourceName: "credit-card 1")
        fourVC.titleText = String("Payment Online")
        fourVC.discriptionText = String("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dui ultricies sit massa.")
        fourVC.buttonText = String("Cool!")
        
        pages.append(firstVC)
        pages.append(secondVC)
        pages.append(thirdVC)
        pages.append(fourVC)
        
        let presenter = OnboardingViewPresenter(coordinator: coordinator)
        let viewController = OnboardingViewController(pages: pages, viewOutput: presenter)
        
        return viewController
    }
    
    //MARK: - Main flow
    static func makeMainFlow(finishDelegate: CoordinatorFinishDelegate, coordinator: AppCoordinator) -> TabBarController {
        let homeNavigationController = UINavigationController()
        let homeCoordinator = HomeCoordinator(type: .home, navigationController: homeNavigationController)
        homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: UIImage.init(systemName: "swirl.circle.righthalf.filled"), tag: 0)
        homeCoordinator.finishDelegate = finishDelegate
        homeCoordinator.start()
        
        let orderNavigationController = UINavigationController()
        let orderCoordinator = OrderCoordinator(type: .order, navigationController: orderNavigationController)
        orderNavigationController.tabBarItem = UITabBarItem(title: "Order", image: UIImage.init(systemName: "swirl.circle.righthalf.filled"), tag: 1)
        orderCoordinator.finishDelegate = finishDelegate
        orderCoordinator.start()
        
        let listNavigationController = UINavigationController()
        let listCoordinator = ListCoordinator(type: .list, navigationController: listNavigationController)
        listNavigationController.tabBarItem = UITabBarItem(title: "List", image: UIImage.init(systemName: "swirl.circle.righthalf.filled"), tag: 2)
        listCoordinator.finishDelegate = finishDelegate
        listCoordinator.start()
        
        let profileNavigationController = UINavigationController()
        let profileCoordinator = ProfileCoordinator(type: .profile, navigationController: profileNavigationController)
        profileNavigationController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage.init(systemName: "swirl.circle.righthalf.filled"), tag: 3)
        profileCoordinator.finishDelegate = finishDelegate
        profileCoordinator.start()
        
        coordinator.addChildCoordinator(homeCoordinator)
        coordinator.addChildCoordinator(orderCoordinator)
        coordinator.addChildCoordinator(listCoordinator)
        coordinator.addChildCoordinator(profileCoordinator)
        
        let tabBarControllers = [homeNavigationController, orderNavigationController, listNavigationController, profileNavigationController]
        let tabBarController = TabBarController(tabBarControllers: tabBarControllers)
        return tabBarController
    }
}

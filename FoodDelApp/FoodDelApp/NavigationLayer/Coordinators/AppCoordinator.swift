//
//  AppCoordinator.swift
//  FoodDelApp
//
//  Created by macbookbro on 19.06.2024.
//

import UIKit

class AppCoordinator: Coordinator {
    
    override func start() {
        showOnBoardingFlow()
    }
    override func finish() {
        print("AppCoordinator finish")
    }
}

// MARK: - Navigation methods
private extension AppCoordinator {
    func showOnBoardingFlow() {
        guard let navigationController = navigationController else {return}
        let onboardingCoordinator = OnboardingCoordinator(type: .onboarding, navigationController: navigationController, finishDelegate: self)
        addChildCoordinator(onboardingCoordinator)
        onboardingCoordinator.start()
    }
    func showMainFlow() {
        
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: CoordinatorProtocol) {
        removeChildCoordinator(childCoordinator)

        switch childCoordinator.type {
        case .app:
            return
        default:
            navigationController?.popToRootViewController(animated: false)
        }
    }
}

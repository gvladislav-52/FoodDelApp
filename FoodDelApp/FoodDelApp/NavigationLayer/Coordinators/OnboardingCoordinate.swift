//
//  OnboardingCoordinate.swift
//  FoodDelApp
//
//  Created by macbookbro on 19.06.2024.
//

import UIKit

//MARK: - OnboardingCoordinator
class OnboardingCoordinator: Coordinator {
    
    //MARK: - Properties
    private let factory = SceneFactory.self
    
    //MARK: - Methods
    override func start() {
        showOnboarding()
    }
    override func finish() {
        print("AppCoordinator finish")
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}

//MARK: - Navigation
private extension OnboardingCoordinator {
    func showOnboarding() {
        let viewController = factory.makeOnboardingScene(coordinator: self)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

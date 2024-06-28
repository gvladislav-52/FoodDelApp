//
//  AppCoordinator.swift
//  FoodDelApp
//
//  Created by macbookbro on 19.06.2024.
//

import UIKit

//MARK: - AppCoordinator
class AppCoordinator: Coordinator {
    
    //MARK: - Properties
    private let userStorage = UserStorage.shared
    private let factory = SceneFactory.self
    
    //MARK: - Methods
    override func start() {
//        UserDefaults.standard.removeObject(forKey: "passedOnboarding")
//        if userStorage.passedOnboarding {
//            showMainFlow()
//        } else {
//            showOnBoardingFlow()
//        }
        let loginPresenter = LoginPresenter(coordinator: self)
        let loginVC = LoginViewController(viewOutput: loginPresenter, state: .initial)
        navigationController?.pushViewController(loginVC, animated: true)
    }
    override func finish() {
        print("AppCoordinator finish")
    }
}

// MARK: - Navigation methods
private extension AppCoordinator {
    func showOnBoardingFlow() {
        guard let navigationController = navigationController else {return}
        factory.makeOnboardingFlow(finishDelegate: self, navigationController: navigationController, coordinator: self)
    }
    func showMainFlow() {
        guard let navigationController = navigationController else {return}
        let tabBarController = factory.makeMainFlow(finishDelegate: self, coordinator: self)
        navigationController.pushViewController(tabBarController, animated: true)
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: CoordinatorProtocol) {
        removeChildCoordinator(childCoordinator)

        switch childCoordinator.type {
        case .onboarding:
            navigationController?.viewControllers.removeAll()
            showMainFlow()
        case .app:
            return
        default:
            navigationController?.popToRootViewController(animated: false)
        }
    }
}

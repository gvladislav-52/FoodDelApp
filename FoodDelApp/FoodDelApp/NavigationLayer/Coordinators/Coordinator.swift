//
//  Coordinator.swift
//  FoodDelApp
//
//  Created by macbookbro on 19.06.2024.
//

import UIKit

enum CoordinatorType {
    case app
    case onboarding
    case home
    case order
    case list
    case profile
}
protocol CoordinatorProtocol: AnyObject {
    var childCoordinators: [CoordinatorProtocol] {get set}
    var type: CoordinatorType {get}
    var navigationController: UINavigationController? {get set}
    var finishDelegate: CoordinatorFinishDelegate? {get set}
    
    func start()
    func finish()
}

extension CoordinatorProtocol {
    func addChildCoordinator(_ childCoordinator: CoordinatorProtocol) {
        childCoordinators.append(childCoordinator)
    }
    
    func removeChildCoordinator(_ childCoordinator: CoordinatorProtocol) {
        childCoordinators = childCoordinators.filter{$0 !== childCoordinator}
    }
}

protocol CoordinatorFinishDelegate: AnyObject {
    func coordinatorDidFinish(childCoordinator: CoordinatorProtocol)
}

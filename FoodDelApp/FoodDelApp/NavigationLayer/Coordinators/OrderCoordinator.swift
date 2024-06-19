//
//  OrderCoordinator.swift
//  FoodDelApp
//
//  Created by macbookbro on 19.06.2024.
//

import UIKit

class OrderCoordinator: Coordinator {
    override func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .yellow
        navigationController?.pushViewController(vc, animated: true)
    }
    override func finish() {
        print("AppCoordinator finish")
    }
}

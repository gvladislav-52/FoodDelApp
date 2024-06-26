//
//  LoginViewController.swift
//  FoodDelApp
//
//  Created by macbookbro on 26.06.2024.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let bottomView = BottomView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColors.white
        setupLayout()
        
    }
    
    func facebookPress() {
        print("facebook")
    }
    
    func googlePlusPress() {
        print("google-plus")
    }
}

private extension LoginViewController {
    private func setupLayout() {
        setupBottomView()
    }
    private func setupBottomView() {
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        
        bottomView.button1Action = googlePlusPress
        bottomView.button2Action = facebookPress
        
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo:self.view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
}

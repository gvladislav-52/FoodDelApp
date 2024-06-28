//
//  LoginViewController.swift
//  FoodDelApp
//
//  Created by macbookbro on 26.06.2024.
//

import UIKit
enum LoginViewState {
    case initial
    case signIn
    case signUp
}

protocol LoginViewInput {
    func onSignInTapped()
    func onSignUpTapped()
    func onFacebookTapped()
    func onGoogleTapped()
    func onForgotTapped()
    func onBackPressed()
}

class LoginViewController: UIViewController {
    
    //MARK: - Properties
    private var state: LoginViewState = .initial
    weak var viewOutput: LoginViewOutput!
    
    //MARK: - Views
    private let bottomView = FDBottomView()
    private let textField = FoodDeliveryTextField()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColors.white
        setupLayout()
    }
    
    //MARK: - Initializers
    init(viewOutput: LoginViewOutput) {
        self.viewOutput = viewOutput
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        setupTextField()
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
            bottomView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.18)
        ])
    }
    private func setupTextField() {
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            textField.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.07),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UIScreen.main.bounds.width * 0.08),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -UIScreen.main.bounds.width * 0.08),
        ])
    }
    
}

extension LoginViewController: LoginViewInput {
    func onBackPressed() {
        
    }
    
    func onSignInTapped() {
        
    }
    
    func onSignUpTapped() {
        
    }
    
    func onFacebookTapped() {
        
    }
    
    func onGoogleTapped() {
        
    }
    
    func onForgotTapped() {
        
    }
}

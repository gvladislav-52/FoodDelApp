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
    private lazy var bottomView = FDBottomView()
    private lazy var textField = FoodDeliveryTextField()
    private lazy var logoView = UIImageView()
    private lazy var signInButton = FoodDeliveryButton()
    private lazy var signUpButton = FoodDeliveryButton()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColors.white
        setupLayout()
    }
    
    //MARK: - Initializers
    init(viewOutput: LoginViewOutput, state: LoginViewState) {
        self.viewOutput = viewOutput
        self.state = state
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
        switch state {
        case .initial:
            setupBottomView()
            setupLogoImage()
            setupSignInButton()
            setupSignUpButton()
        case .signIn:
            setupBottomView()
            setupTextField()
        case .signUp:
            setupBottomView()
            setupTextField()
        }
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
    
    func setupLogoImage() {
        view.addSubview(logoView)
        logoView.translatesAutoresizingMaskIntoConstraints = false
        logoView.image = UIImage(named: "appstore")
        logoView.contentMode = .scaleAspectFit
        
        NSLayoutConstraint.activate([
            logoView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: UIScreen.main.bounds.height * 0.15),
            logoView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: UIScreen.main.bounds.width * 0.05),
            logoView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -UIScreen.main.bounds.width * 0.05),
            logoView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.35)
        ])
    }
    func setupSignInButton() {
        view.addSubview(signInButton)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        //signInButton.action = buttonPressed
        signInButton.scheme = .orange
        signInButton.setTitle("Sign In")
        
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: UIScreen.main.bounds.height * 0.07),
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UIScreen.main.bounds.width * 0.08),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -UIScreen.main.bounds.width * 0.08),
            signInButton.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.065)
        ])
    }
    func setupSignUpButton() {
        view.addSubview(signUpButton)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        //signInButton.action = buttonPressed
        signUpButton.scheme = .gray
        signUpButton.setTitle("Sign Up")
        
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: UIScreen.main.bounds.height * 0.025),
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UIScreen.main.bounds.width * 0.08),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -UIScreen.main.bounds.width * 0.08),
            signUpButton.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.065)
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

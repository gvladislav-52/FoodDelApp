//
//  LoginViewPresenter.swift
//  FoodDelApp
//
//  Created by macbookbro on 28.06.2024.
//

import Foundation

protocol LoginViewOutput: AnyObject {
    func authStart()
    func regStart()
    func goToFacebookLogin()
    func goToGoogleLogin()
    func goToSignIn()
    func goToSignUp()
    func goToForgotPass()
    func back()
}

class LoginPresenter {
    private var coordinator: AppCoordinator!
    var viewInput: LoginViewInput?
    
    init(coordinator: AppCoordinator!, viewInput: LoginViewInput? = nil) {
        self.coordinator = coordinator
        self.viewInput = viewInput
    }
}

extension LoginPresenter: LoginViewOutput {
    func authStart() {
        
    }
    
    func regStart() {
        
    }
    
    func goToFacebookLogin() {
        
    }
    
    func goToGoogleLogin() {
        
    }
    
    func goToSignIn() {
        
    }
    
    func goToSignUp() {
        
    }
    
    func goToForgotPass() {
        
    }
    
    func back() {
        
    }
    
    
}

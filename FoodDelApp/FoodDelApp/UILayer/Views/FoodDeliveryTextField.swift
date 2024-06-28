//
//  FoodDeliveryTextField.swift
//  FoodDelApp
//
//  Created by macbookbro on 27.06.2024.
//

import UIKit

class FoodDeliveryTextField: UITextField {

    init() {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        self.layer.cornerRadius = UIScreen.main.bounds.width *  0.0625
        self.backgroundColor = AppColors.gray
        self.font = .Roboto.regular.size(of: UIScreen.main.bounds.height * 0.02)
        self.placeholder = "Text to input"
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width * 0.05, height: self.frame.height))
        self.leftView = paddingView
        self.rightView = paddingView
        self.leftViewMode = .always
        self.rightViewMode = .always
    }

}

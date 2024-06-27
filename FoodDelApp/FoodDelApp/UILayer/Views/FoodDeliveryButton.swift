//
//  FoodDeliveryButton.swift
//  FoodDelApp
//
//  Created by macbookbro on 27.06.2024.
//

import UIKit

enum FDButtonColorSchemes {
    case white
    case orange
    case gray
}

class FoodDeliveryButton: UIView {
    
    private let button = UIButton()
    var action: (()-> Void)?
    var scheme: FDButtonColorSchemes = .white {
        didSet {
            setColorScheme(scheme: scheme)
        }
    }
    init(scheme: FDButtonColorSchemes = .white) {
        super.init(frame: .zero)
        self.scheme = scheme
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.backgroundColor = .clear
        setupButton()
    }
}

private extension FoodDeliveryButton {
    func setupButton() {
        self.addSubview(button)
        
        button.titleLabel?.font = .Roboto.bold.size(of: UIScreen.main.bounds.width * 0.05)
        button.layer.cornerRadius = UIScreen.main.bounds.width *  0.0625
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            button.topAnchor.constraint(equalTo: self.topAnchor)
        ])
        
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    @objc private func buttonPressed() {
        guard let action = self.action else {return}
        action()
    }
    
    private func setColorScheme(scheme: FDButtonColorSchemes) {
        switch scheme {
        case .white:
            button.backgroundColor = AppColors.white
            button.setTitleColor(AppColors.accentOrange, for: .normal)
        case .gray:
            button.backgroundColor = AppColors.gray
            button.setTitleColor(AppColors.black, for: .normal)
        case .orange:
            button.backgroundColor = AppColors.accentOrange
            button.setTitleColor(AppColors.white, for: .normal)
            
        }
    }
}

extension FoodDeliveryButton {
    
    public func setTitle(_ title: String?) {
        button.setTitle(title, for: .normal)
    }
}

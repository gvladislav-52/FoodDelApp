//
//  BottomView.swift
//  FoodDelApp
//
//  Created by macbookbro on 26.06.2024.
//

import UIKit

class BottomView: UIView {

    private let label = UILabel()
    private let view1 = UIView()
    private let view2 = UIImageView()
    private let button1 = UIButton()
    private let button2 = UIButton()
    
    var button1Action: (() -> Void)?
    var button2Action: (() -> Void)?
    
    init() {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        self.backgroundColor = .clear
        setupLabel()
        setupView1()
        setupView2()
        setupButton1()
        setupButton2()
    }
    private func setupLabel() {
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Or connect with"
        label.font = .Roboto.regular.size(of: UIScreen.main.bounds.width * 0.04)
        label.textColor = AppColors.bottomViewGray
        label.adjustsFontSizeToFitWidth = true
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -UIScreen.main.bounds.width * 0.065)
        ])
    }
    private func setupView1() {
        self.addSubview(view1)
        view1.translatesAutoresizingMaskIntoConstraints = false
        view1.backgroundColor = AppColors.bottomViewGray.withAlphaComponent(0.3)
        NSLayoutConstraint.activate([
            view1.centerYAnchor.constraint(equalTo: label.centerYAnchor),
            view1.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            view1.trailingAnchor.constraint(equalTo: label.leadingAnchor, constant: -UIScreen.main.bounds.width * 0.03),
            view1.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.005)
        ])
    }
    private func setupView2() {
        self.addSubview(view2)
        view2.translatesAutoresizingMaskIntoConstraints = false
        view2.image = UIImage(named: "BottomView")
        view2.contentMode = .scaleAspectFit
                
        NSLayoutConstraint.activate([
            view2.topAnchor.constraint(equalTo: view1.bottomAnchor, constant: UIScreen.main.bounds.height * 0.035),
            view2.leftAnchor.constraint(equalTo: self.leftAnchor),
            view2.widthAnchor.constraint(lessThanOrEqualToConstant: UIScreen.main.bounds.width*0.45),
            view2.heightAnchor.constraint(lessThanOrEqualToConstant: UIScreen.main.bounds.height*0.45)
        ])
    }
    private func setupButton1() {
        self.addSubview(button1)
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.setImage(UIImage(named: "google-plus"), for: .normal)
        button1.contentMode = .scaleAspectFit
        button1.addTarget(self, action: #selector(button1Tapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            button1.topAnchor.constraint(equalTo: label.bottomAnchor, constant: UIScreen.main.bounds.height * 0.025),
            button1.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -UIScreen.main.bounds.width * 0.07)
        ])
    }

    private func setupButton2() {
        self.addSubview(button2)
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.setImage(UIImage(named: "facebook"), for: .normal)
        button2.contentMode = .scaleAspectFit
        button2.addTarget(self, action: #selector(button2Tapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            button2.centerYAnchor.constraint(equalTo: button1.centerYAnchor),
            button2.rightAnchor.constraint(equalTo: button1.leftAnchor, constant:  -UIScreen.main.bounds.width * 0.07)

        ])
    }
}

private extension BottomView {
    @objc func button1Tapped() {
        button1Action?()
    }
    @objc func button2Tapped() {
        button2Action?()
    }
}

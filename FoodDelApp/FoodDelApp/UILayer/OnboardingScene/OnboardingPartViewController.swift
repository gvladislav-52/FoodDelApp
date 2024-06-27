//
//  OnboardingPartViewController.swift
//  FoodDelApp
//
//  Created by macbookbro on 24.06.2024.
//

import UIKit

class OnboardingPartViewController: UIViewController {
    
    //MARK: - Properties
    var imageToShow: UIImage? {
        didSet {
            imageView.image = self.imageToShow
        }
    }
    
    var  titleText: String? {
        didSet {
            titleLabel.text = self.titleText
        }
    }
    
    var discriptionText: String?  {
        didSet {
            discriptionLabel.text = self.discriptionText
        }
    }
    
    var buttonText: String?
    
    //MARK: - Views
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let discriptionLabel = UILabel()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
}


//MARK: - Layout
private extension OnboardingPartViewController {
    
    func setupLayout() {
        setupView()
        setupImageView()
        setupTitleLabel()
        setupDescriptionLabel()
    }
    
    func setupView()
    {
        view.backgroundColor = AppColors.accentOrange
    }
    
    func setupImageView() {
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -UIScreen.main.bounds.height * 0.055),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(lessThanOrEqualToConstant: UIScreen.main.bounds.width * 0.5),
            imageView.heightAnchor.constraint(lessThanOrEqualToConstant: UIScreen.main.bounds.height * 0.5)
        ])
    }
    
    func setupTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .Roboto.bold.size(of: UIScreen.main.bounds.width * 0.06)
        titleLabel.textColor =  AppColors.white
        titleLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: UIScreen.main.bounds.height * 0.025),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func setupDescriptionLabel() {
        view.addSubview(discriptionLabel)
        discriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        discriptionLabel.font = .Roboto.regular.size(of: UIScreen.main.bounds.width * 0.035)
        discriptionLabel.textColor = AppColors.white
        discriptionLabel.numberOfLines = 0
        discriptionLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            discriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: UIScreen.main.bounds.height * 0.025),
            //discriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            discriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UIScreen.main.bounds.width * 0.2),
            discriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -UIScreen.main.bounds.width * 0.2)
        ])
    }
}

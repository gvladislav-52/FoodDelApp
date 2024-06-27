//
//  OnboardingViewController.swift
//  FoodDelApp
//
//  Created by macbookbro on 20.06.2024.
//

import UIKit

//MARK: - OnboardingViewController
class OnboardingViewController: UIViewController {

    //MARK: - Properties
    private var pages = [OnboardingPartViewController]()
    private var currentPageIndex = 0
    //MARK: - Views
    private let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    private let pageControl = UIPageControl ()
    private let bottomButton = UIButton()
    var viewOutput: OnboardingViewOutput!
    
    init(pages: [OnboardingPartViewController] = [OnboardingPartViewController](), viewOutput: OnboardingViewOutput!) {
        self.pages = pages
        self.viewOutput = viewOutput
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
}

//MARK: - Actions
private extension OnboardingViewController {
    @objc func buttonPressed() {
        switch pageControl.currentPage {
        case 0:
            pageControl.currentPage = 1
            pageViewController.setViewControllers([pages[1]], direction: .forward, animated: true, completion: nil)
        case 1:
            pageControl.currentPage = 2
            pageViewController.setViewControllers([pages[2]], direction: .forward, animated: true, completion: nil)
        case 2:
            pageControl.currentPage = 3
            pageViewController.setViewControllers([pages[3]], direction: .forward, animated: true, completion: nil)
            bottomButton.setTitle(pages[3].buttonText, for: .normal)
        case 3:
            print("Exit")
            viewOutput.onboardingFinish()
        default:
            break
        }
    }
}

//MARK: - Layout
private extension OnboardingViewController {
    func setupLayout() {
        setupPageViewController()
        setupPageControl()
        setupButton()
    }
    func setupPageViewController() {
        pageViewController.delegate = self
        pageViewController.dataSource = self
        pageViewController.view.backgroundColor = AppColors.accentOrange
        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: true)
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
    }
    func setupPageControl() {
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = 0
        let page = pages[0]
        let title = page.buttonText
        bottomButton.setTitle(title, for: .normal)
        
        
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(pageControl)
        
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:  -UIScreen.main.bounds.height * 0.04)
        ])
    }
    func setupButton() {
        view.addSubview(bottomButton)
        
        bottomButton.backgroundColor = AppColors.gray
        bottomButton.titleLabel?.font = .Roboto.bold.size(of: UIScreen.main.bounds.width * 0.05)
        bottomButton.setTitleColor(.black, for: .normal)
        bottomButton.layer.cornerRadius = UIScreen.main.bounds.width *  0.0625
        
        bottomButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomButton.bottomAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: -UIScreen.main.bounds.height * 0.06),
            bottomButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UIScreen.main.bounds.width * 0.08),
            bottomButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -UIScreen.main.bounds.width * 0.08),
            bottomButton.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.07)
        ])
        
        bottomButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
}

//MARK: - UIPageViewControllerDataSource delegate
extension OnboardingViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController as! OnboardingPartViewController), currentIndex > 0 else {
            return nil
        }
        return pages[currentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController as! OnboardingPartViewController), currentIndex < pages.count-1 else {
            return nil
        }
        return pages[currentIndex + 1]
    }
}

//MARK: - UIPageViewControllerDataSource delegate
extension OnboardingViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        if let index = pages.firstIndex(of: pendingViewControllers.first! as! OnboardingPartViewController) {
            currentPageIndex = index
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            pageControl.currentPage = currentPageIndex
            let page = pages[currentPageIndex]
            let title = page.buttonText
            bottomButton.setTitle(title, for: .normal)
        }
    }
}

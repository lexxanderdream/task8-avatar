//
//  ViewController.swift
//  task8
//
//  Created by Alexander Zhuchkov on 24.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.showsVerticalScrollIndicator = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize.height = 1000
        return scrollView
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "person.crop.circle.fill"))
        imageView.tintColor = .tertiaryLabel
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 36).isActive = true
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor).isActive = true
        return imageView
    }()
    
    
    private func setupView() {
        title = "Avatar"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
    private func setupNavigationBar() {
        guard
            let navigationBar = self.navigationController?.navigationBar,
            let largeTitleClass = NSClassFromString("_UINavigationBarLargeTitleView") as? UIView.Type,
            let largeTitleView = self.findSubview(parentView: navigationBar, type: largeTitleClass)
        else { return }
        
        largeTitleView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.rightAnchor.constraint(equalTo: largeTitleView.rightAnchor, constant: -10),
            imageView.bottomAnchor.constraint(equalTo: largeTitleView.bottomAnchor, constant: -5)
        ])
    }
    
    
    // MARK: - Helper Methods
    private func findSubview(parentView: UIView, type: UIView.Type) -> UIView? {
        for subview in parentView.subviews {
            if subview.isKind(of: type) {
                return subview
            } else if let desiredInstance = findSubview(parentView: subview, type: type) {
                return desiredInstance
            }
        }
        return nil
    }
    
    
}

// MARK: - UIViewController Life Cycle
extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setupNavigationBar()
    }
}


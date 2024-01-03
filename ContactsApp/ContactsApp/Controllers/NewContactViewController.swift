//
//  NewContactViewController.swift
//  ContactsApp
//
//  Created by Nikolai Maksimov on 03.01.2024.
//

import UIKit

final class NewContactViewController: UIViewController {
    
    // MARK: Private properties
    private var navigationBar = UINavigationBar()
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        commonInit()
    }
}

// MARK: - Private methods
private extension NewContactViewController {
    
    func commonInit() {
        setupConstraintsForNavBar()
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        let cancelButton = getBurButtonItem(withTitle: "Cancel", action: #selector(cancelButtonPressed))
        let doneButton = getBurButtonItem(withTitle: "Done", action: nil)
        
        let navigationItem = UINavigationItem(title: "New Contact")
        navigationItem.leftBarButtonItem = cancelButton
        navigationItem.rightBarButtonItem = doneButton
        
        navigationBar.items = [navigationItem]
        navigationBar.tintColor = .white
        
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.backgroundColor = UIColor(red: 21/255,
                                                          green: 101/255,
                                                          blue: 192/255,
                                                          alpha: 194/255)
        navigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationBar.standardAppearance = navigationBarAppearance
    }
    
    func getBurButtonItem(withTitle title: String, action: Selector?) -> UIBarButtonItem {
        return UIBarButtonItem(
            title: title,
            style: .done,
            target: self,
            action: action
        )
    }
    
    @objc func cancelButtonPressed() {
        dismiss(animated: true)
    }
}

// MARK: - Constraints
private extension NewContactViewController {
    
    func setupConstraintsForNavBar() {
        view.addSubview(navigationBar)
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}



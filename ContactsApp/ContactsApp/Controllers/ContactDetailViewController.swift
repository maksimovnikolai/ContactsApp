//
//  ContactDetailViewController.swift
//  ContactsApp
//
//  Created by Nikolai Maksimov on 05.01.2024.
//

import UIKit

final class ContactDetailViewController: UIViewController {
    
    var contact: Contact!
    
    // MARK: Private properties
    private lazy var personImage = UIImageView()
    private lazy var name: UILabel = .makeLabel(withTitle: "name", size: 16)
    private lazy var userName: UILabel = .makeLabel(withTitle: "username", size: 16)
    private lazy var email: UILabel = .makeLabel(withTitle: "email", size: 16)
    private lazy var phone: UILabel = .makeLabel(withTitle: "phone", size: 16)
    private lazy var website: UILabel = .makeLabel(withTitle: "website", size: 16)
    private lazy var verticalStack: UIStackView = .makeStackView(axis: .vertical)
    private lazy var navigationBar = UINavigationBar()
    
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
}

// MARK: - Private methods
private extension ContactDetailViewController {
    
    func commonInit() {
        configureContactImageView()
        configureStackView()
        updateUI()
        configureNavigationBar()
        setupNavigationBarConstraints()
    }
    
    func updateUI() {
        title = contact.name
        name.text = " ➤ Name: \(contact.name)"
        userName.text = contact.username != "" ? " ➤ User name: \(contact.username)" : " ➤ User name: отсутствует"
        email.text = contact.email != "" ? " ✉️ : \(contact.email)" : " ✉️ : отсутствует"
        phone.text = contact.phone != "" ? " 📞 : \(contact.phone)" : " 📞 : отсутствует"
        website.text = contact.website != "" ? " 🖥️ : \(contact.website)" : " 🖥️ : отсутствует"
    }
    
    func configureContactImageView() {
        view.backgroundColor = UIColor(red: 248/255, green: 250/255, blue: 229/255, alpha: 1)
        personImage.image = UIImage(systemName: "person")
        setupPersonImageConstraints()
    }
    
    func configureStackView() {
        [name, userName, email, phone, website].forEach { verticalStack.addArrangedSubview($0) }
        setupStackViewConstraints()
    }
    
    func configureNavigationBar() {
        let cancelButton = UIBarButtonItem(title: "Закрыть", style: .plain, target: self, action: #selector(dismissViewController))
        
        let navigationItem = UINavigationItem(title: "\(contact.name)")
        navigationItem.rightBarButtonItem = cancelButton
        
        navigationBar.items = [navigationItem]
        navigationBar.tintColor = .white
        
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = UIColor(
            red: 21/255,
            green: 101/255,
            blue: 192/255,
            alpha: 194/255
        )
        navigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationBar.standardAppearance = navigationBarAppearance
    }
    
    @objc
    func dismissViewController() {
        dismiss(animated: true)
    }
}

// MARK: - Constraints
private extension ContactDetailViewController {
    
    func setupNavigationBarConstraints() {
        view.addSubview(navigationBar)
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    func setupPersonImageConstraints() {
        personImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(personImage)
        NSLayoutConstraint.activate([
            personImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
            personImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            personImage.widthAnchor.constraint(equalToConstant: 300),
            personImage.heightAnchor.constraint(equalToConstant: 300),
        ])
    }
    
    func setupStackViewConstraints() {
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(verticalStack)
        NSLayoutConstraint.activate([
            verticalStack.topAnchor.constraint(equalTo: personImage.bottomAnchor, constant: 60),
            verticalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            verticalStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            verticalStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
}

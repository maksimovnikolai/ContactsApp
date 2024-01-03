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
    private var doneButton = UIBarButtonItem()
    private let nameTextField: UITextField = .makeTextField(pHolder: "First name")
    private let lastNameTextField: UITextField = .makeTextField(pHolder: "Last name")
    private let nameLabel: UILabel = .makeLabel(withTitle: "Name", size: 16)
    private let lastNameLabel: UILabel = .makeLabel(withTitle: "Last name", size: 16)
    private let verticalStack: UIStackView = .makeStackView(axis: .vertical, spacing: 20)
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        commonInit()
    }
}

// MARK: - Private methods
private extension NewContactViewController {
    
    func commonInit() {
        view.backgroundColor = .systemBackground
        
        setupConstraintsForNavBar()
        setupNavigationBar()
        setupConstraintsForVStack()
        setupVStack()
        configureNameTextField()
        
    }
    
    // MARK: Configure Navigation Bar
    func setupNavigationBar() {
        let cancelButton = getBurButtonItem(withTitle: "Cancel", action: #selector(cancelButtonPressed))
        doneButton = getBurButtonItem(withTitle: "Done", action: #selector(doneButtonPressed))
        doneButton.isEnabled = false
        
        let navigationItem = UINavigationItem(title: "New Contact")
        navigationItem.leftBarButtonItem = cancelButton
        navigationItem.rightBarButtonItem = doneButton
        
        navigationBar.items = [navigationItem]
        navigationBar.tintColor = .white
        
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.backgroundColor = UIColor(
            red: 21/255,
            green: 101/255,
            blue: 192/255,
            alpha: 194/255
        )
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
    
    @objc
    func cancelButtonPressed() {
        dismiss(animated: true)
    }
    
    @objc
    func doneButtonPressed() {
        saveEndExit()
    }
   
    func saveEndExit() {
        dismiss(animated: true)
    }
    
    // MARK: Configure Vertical Stack View
    func setupVStack() {
        let nameVStack: UIStackView = .makeStackView(axis: .vertical)
        nameVStack.spacing = 4
        nameVStack.distribution = .fillProportionally
        nameVStack.addArrangedSubview(nameLabel)
        nameVStack.addArrangedSubview(nameTextField)
        
        let lastNameVStack: UIStackView = .makeStackView(axis: .vertical)
        lastNameVStack.spacing = 4
        lastNameVStack.distribution = .fillProportionally
        lastNameVStack.addArrangedSubview(lastNameLabel)
        lastNameVStack.addArrangedSubview(lastNameTextField)
        
        [nameVStack, lastNameVStack].forEach { verticalStack.addArrangedSubview($0) }
    }
    
    // MARK: Configure Name TexField
    func configureNameTextField() {
        nameTextField.addTarget(self, action: #selector(nameTextFieldDidChange), for: .editingChanged)
    }
    
    @objc
    func nameTextFieldDidChange() {
        guard let nameTextField = nameTextField.text else { return }
        doneButton.isEnabled = !nameTextField.isEmpty
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
    
    func setupConstraintsForVStack() {
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(verticalStack)
        NSLayoutConstraint.activate([
            verticalStack.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            verticalStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            verticalStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        ])
    }
}

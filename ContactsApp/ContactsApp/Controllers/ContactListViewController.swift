//
//  ContactListViewController.swift
//  ContactsApp
//
//  Created by Nikolai Maksimov on 02.01.2024.
//

import UIKit

protocol NewContactViewControllerDelegate: AnyObject {
    func saveContact(_ newContactViewController: NewContactViewController, _ contact: Contact)
}

final class ContactListViewController: UIViewController {
    
    // MARK: Private properties
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var contacts: [Contact] = []
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
}

// MARK: - Private methods
extension ContactListViewController {
    
    private func commonInit() {
        configureNavBar()
        configureTableView()
    }
    
    private func configureNavBar() {
        title = "Contacts"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupNavBarAppearance()
        setupRightBarButton()
    }
    
    private func setupNavBarAppearance() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = UIColor(
            red: 21/255,
            green: 101/255,
            blue: 192/255,
            alpha: 194/255
        )
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationController?.navigationBar.tintColor = .white
    }
    
    private func setupRightBarButton() {
        let presentButton = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(presentNewContactController)
        )
        navigationItem.rightBarButtonItem = presentButton
    }
    
    @objc
    private func presentNewContactController() {
        let newContactVC = NewContactViewController()
        newContactVC.delegate = self
        present(newContactVC, animated: true)
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "contact")
        tableView.frame = view.bounds
        tableView.dataSource = self
    }
}

// MARK: - UITableViewDataSource
extension ContactListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contact", for: indexPath)
        let contact = contacts[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = contact.fullName
        cell.contentConfiguration = content
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ContactListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            contacts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

// MARK: - NewContactViewControllerDelegate
extension ContactListViewController: NewContactViewControllerDelegate {
    
    func saveContact(_ newContactViewController: NewContactViewController, _ contact: Contact) {
        contacts.append(contact)
        tableView.reloadData()
    }
}

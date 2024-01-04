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
private extension ContactListViewController {
    
    func commonInit() {
        configureNavBar()
        configureTableView()
    }
    
    func configureNavBar() {
        title = "Contacts"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupNavBarAppearance()
        setupRightBarButton()
    }
    
    func setupNavBarAppearance() {
        let navBarAppearance = UINavigationBarAppearance()
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
    
    func setupRightBarButton() {
        let presentButton = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(showActionSheet)
        )
        navigationItem.rightBarButtonItem = presentButton
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "contact")
        tableView.frame = view.bounds
        tableView.dataSource = self
    }
}

// MARK: - Action Sheet
private extension ContactListViewController {
    
    @objc func showActionSheet() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let fetchContacts = UIAlertAction(title: "Fetch contacts", style: .default) { _ in
            NetworkManager.shared.fetchContacts { result in
                switch result {
                case .success(let contacts):
                    self.contacts = contacts
                    self.tableView.reloadData()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
        
        let createNewContact = UIAlertAction(title: "Create contact", style: .default) { _ in
            self.presentNewContactController()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(fetchContacts)
        alert.addAction(createNewContact)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
    func presentNewContactController() {
        let newContactVC = NewContactViewController()
        newContactVC.delegate = self
        present(newContactVC, animated: true)
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
        content.text = contact.name
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

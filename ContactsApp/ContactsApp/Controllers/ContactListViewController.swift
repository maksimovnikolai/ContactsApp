//
//  ContactListViewController.swift
//  ContactsApp
//
//  Created by Nikolai Maksimov on 02.01.2024.
//

import UIKit

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

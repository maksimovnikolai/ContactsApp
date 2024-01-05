//
//  ContactDetailViewController.swift
//  ContactsApp
//
//  Created by Nikolai Maksimov on 05.01.2024.
//

import UIKit

final class ContactDetailViewController: UIViewController {
    
    private lazy var name: UILabel = .makeLabel(withTitle: "Name", size: 16)
    private lazy var userName: UILabel = .makeLabel(withTitle: "Name", size: 16)
    private lazy var email: UILabel = .makeLabel(withTitle: "Name", size: 16)
    private lazy var phone: UILabel = .makeLabel(withTitle: "Name", size: 16)
    private lazy var website: UILabel = .makeLabel(withTitle: "Name", size: 16)
    private lazy var verticalStack: UIStackView = .makeStackView(axis: .vertical)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension ContactListViewController {
    
}

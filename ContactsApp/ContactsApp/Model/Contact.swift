//
//  Contact.swift
//  ContactsApp
//
//  Created by Nikolai Maksimov on 02.01.2024.
//

import Foundation

struct Contact {
    let name: String
    let surName: String
    
    var fullName: String {
        "\(name) \(surName)"
    }
}

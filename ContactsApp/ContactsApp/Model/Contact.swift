//
//  Contact.swift
//  ContactsApp
//
//  Created by Nikolai Maksimov on 02.01.2024.
//

import Foundation

struct Contact: Decodable {
    let name: String
    let username: String
    let email: String
    let phone: String
    let website: String
}

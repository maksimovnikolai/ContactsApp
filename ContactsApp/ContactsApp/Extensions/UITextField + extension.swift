//
//  UITextField + extension.swift
//  ContactsApp
//
//  Created by Nikolai Maksimov on 03.01.2024.
//

import UIKit

extension UITextField {
    
    static func makeTextField(pHolder: String) -> UITextField {
        let tf = UITextField()
        tf.placeholder = pHolder
        tf.borderStyle = .roundedRect
        return tf
    }
}

//
//  UILabel + extension.swift
//  ContactsApp
//
//  Created by Nikolai Maksimov on 03.01.2024.
//

import UIKit

extension UILabel {
    
    static func makeLabel(withTitle title: String, size: CGFloat) -> UILabel {
        let label = UILabel()
        label.text = title
        label.font = .systemFont(ofSize: size)
        return label
    }
}

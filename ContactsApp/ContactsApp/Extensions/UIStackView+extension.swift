//
//  UIStackView+extension.swift
//  ContactsApp
//
//  Created by Nikolai Maksimov on 03.01.2024.
//

import UIKit

typealias Axis = NSLayoutConstraint.Axis
typealias Alignment = UIStackView.Alignment
typealias Distribution = UIStackView.Distribution

extension UIStackView {
    
    static func makeStackView(axis: Axis, alignment: Alignment = .fill, distribution: Distribution = .fill, spacing: CGFloat = 8) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.alignment = alignment
        stackView.distribution = distribution
        stackView.spacing = spacing
        return stackView
    }
}

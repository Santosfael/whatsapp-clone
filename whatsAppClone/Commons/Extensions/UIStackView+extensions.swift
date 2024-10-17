//
//  UIStackView+extensions.swift
//  whatsAppClone
//
//  Created by Rafael on 13/10/24.
//

import UIKit

extension UIStackView {

    // MARK: - Public Methods
    public func addArrangedSubviews(_ arrangedSubviews: UIView...) {
        arrangedSubviews.forEach(addArrangedSubview)
    }
}

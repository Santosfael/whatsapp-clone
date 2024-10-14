//
//  UIView+extensions.swift
//  whatsAppClone
//
//  Created by Rafael on 13/10/24.
//

import UIKit

extension UIView {
    public func addSubviews(_ subViews: UIView...) {
        subViews.forEach(addSubview)
    }
}
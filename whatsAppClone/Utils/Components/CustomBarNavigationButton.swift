//
//  CustomButton.swift
//  whatsAppClone
//
//  Created by Rafael on 16/10/24.
//

import UIKit

class CustomBarNavigationButton: UIButton {

    // MARK: - Initialized
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Static Methods
    static func createCustomButton(image: UIImage?, tintColor: UIColor, size: CGSize, backgroundColor: UIColor? = nil) -> UIButton {
        let button = UIButton(type: .system)
        button.setImage(image, for: .normal)
        button.tintColor = tintColor
        button.widthAnchor.constraint(equalToConstant: size.width).isActive = true
        button.heightAnchor.constraint(equalToConstant: size.height).isActive = true

        if let bgColor = backgroundColor {
            button.layer.cornerRadius = size.width / 2
            button.layer.masksToBounds = true
            button.backgroundColor = bgColor
        }

        return button
    }
}

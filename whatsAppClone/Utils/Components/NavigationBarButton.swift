//
//  NavigationBarButton.swift
//  whatsAppClone
//
//  Created by Rafael on 17/10/24.
//

import UIKit

enum NavigationBarButton {
    // MARK: - Cases
    case primaryButton(image: UIImage?, targetSize: CGSize = CGSize(width: 20, height: 20), backgroundColor: UIColor? = nil)
    case secondaryButton(image: UIImage?, size: CGSize = CGSize(width: 28, height: 28))
    case ternaryButton(title: String, backgroundColor: UIColor?)
    case defaultButton(image: UIImage?, targetSize: CGSize = CGSize(width: 20, height: 20), tintColor: UIColor)

    // MARK: - Public Methods
    func createButton() -> UIButton {
        switch self {
        case .primaryButton(let image, let targetSize, let backgroundColor):
            return CustomBarNavigationButton.createCustomButton(image: UIImage.resizeImage(image: image,
                                                                                           targetSize: targetSize),
                                                                tintColor: Colors.secondaryColor,
                                                                size: CGSize(width: 28, height: 28),
                                                                backgroundColor: backgroundColor)

        case .secondaryButton(let image, let size):
            lazy var button = CustomBarNavigationButton.createCustomButton(image: image,
                                                                           tintColor: Colors.ternaryColor,
                                                                           size: size)
            button.contentVerticalAlignment = .fill
            button.contentHorizontalAlignment = .fill
            return button
        case .ternaryButton(let title, let backgroundColor):
            lazy var button: UIButton = {
                let button = UIButton(type: .system)
                button.setTitle(title, for: .normal)
                button.backgroundColor = backgroundColor
                return button
            }()
            return button
        case .defaultButton(let image, let targetSize, let tintColor):
            lazy var button = CustomBarNavigationButton.createCustomButton(image: image,
                                                                           tintColor: tintColor,
                                                                           size: targetSize)
            return button
        }
    }
}

//
//  NavigationBarButton.swift
//  whatsAppClone
//
//  Created by Rafael on 17/10/24.
//

import UIKit

enum NavigationBarButton {
    // MARK: - Cases
    case primaryButton(image: UIImage?)
    case secondaryButton(image: UIImage?)
    case ternaryButton(title: String, backgroundColor: UIColor?)

    // MARK: - Public Methods
    func createButton() -> UIButton {
        switch self {
        case .primaryButton(let image):
            return CustomBarNavigationButton.createCustomButton(image: UIImage.resizeImage(image: image,
                                                                                           targetSize: CGSize(width: 20, height: 20)),
                                                                tintColor: Colors.secondaryColor,
                                                                size: CGSize(width: 28, height: 28),
                                                                backgroundColor: Colors.backgroundGrayLight8)

        case .secondaryButton(let image):
            lazy var button = CustomBarNavigationButton.createCustomButton(image: image,
                                                                           tintColor: Colors.ternaryColor,
                                                                           size: CGSize(width: 28, height: 28))
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
        }
    }
}

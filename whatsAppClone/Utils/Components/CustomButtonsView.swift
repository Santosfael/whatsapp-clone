//
//  ButtonsBarView.swift
//  whatsAppClone
//
//  Created by Rafael on 16/10/24.
//

import UIKit

final class CustomButtonsView: UIView {

    // MARK: - Initializeds
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods
    public func addBarButtonsItems(buttonTypes: [NavigationBarButton]) -> UIBarButtonItem {
        let buttons = buttonTypes.map { $0.createButton() }

        if buttons.count == 1 {
            return UIBarButtonItem(customView: buttons[0])
        } else {
            let stackView = UIStackView(arrangedSubviews: buttons)
            stackView.axis = .horizontal
            stackView.spacing = 10
            return UIBarButtonItem(customView: stackView)
        }
    }

    public func addCustomButtons(buttonTypes: [NavigationBarButton]) -> UIView {
        let buttons = buttonTypes.map { $0.createButton() }
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.axis = .horizontal
        stackView.spacing = 10

        return stackView
    }
}

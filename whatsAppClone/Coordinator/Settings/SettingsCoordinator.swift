//
//  SettingsCoordinator.swift
//  whatsAppClone
//
//  Created by Rafael on 12/11/24.
//

import Foundation
import UIKit

final class SettingsCoordinator: CoordinatorProtocol {

    // MARK: - Public Propertites
    public var navigationController: UINavigationController

    // MARK: - Initialized
    init() {
        self.navigationController = UINavigationController()
    }

    // MARK: - Public Methods
    public func start() {
        let settingsViewController = SettingsViewController()
        let tabBarItem = TabBarItem.settings

        settingsViewController.title = tabBarItem.title
        settingsViewController.tabBarItem = UITabBarItem(title: tabBarItem.title, image: tabBarItem.image, selectedImage: tabBarItem.selectedImages)
        navigationController.setViewControllers([settingsViewController], animated: true)
    }
}

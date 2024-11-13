//
//  UpdatesCoordinator.swift
//  whatsAppClone
//
//  Created by Rafael on 12/11/24.
//

import Foundation
import UIKit

final class UpdatesCoordinator: CoordinatorProtocol {

    // MARK: - Public Propertites
    public var navigationController: UINavigationController

    // MARK: - Initialized
    init() {
        self.navigationController = UINavigationController()
    }

    // MARK: - Public Methods
    func start() {
        let updatesViewController = UpdatesViewController()
        let tabBarItem = TabBarItem.updates

        updatesViewController.title = tabBarItem.title
        updatesViewController.tabBarItem = UITabBarItem(title: tabBarItem.title, image: tabBarItem.image, selectedImage: tabBarItem.selectedImages)
        navigationController.setViewControllers([updatesViewController], animated: true)
    }
}

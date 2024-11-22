//
//  CallsCoordinator.swift
//  whatsAppClone
//
//  Created by Rafael on 12/11/24.
//

import Foundation
import UIKit

final class CallsCoordinator: CoordinatorProtocol {

    // MARK: - Public Propertites
    public var navigationController: UINavigationController

    // MARK: - Initialized
    init() {
        self.navigationController = UINavigationController()
    }

    // MARK: - Public Methods
    public func start() {
        let callsViewController = CallViewController()
        let tabBarItem = TabBarItem.calls

        callsViewController.title = tabBarItem.title
        callsViewController.tabBarItem = UITabBarItem(title: tabBarItem.title, image: tabBarItem.image, selectedImage: tabBarItem.selectedImages)
        navigationController.setViewControllers([callsViewController], animated: true)

    }
}

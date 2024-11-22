//
//  CommunitiesCoordinator.swift
//  whatsAppClone
//
//  Created by Rafael on 12/11/24.
//

import Foundation
import UIKit

final class CommunitiesCoordinator: CoordinatorProtocol {

    // MARK: - Public Propertites
    public var navigationController: UINavigationController

    // MARK: - Initialized
    init() {
        self.navigationController = UINavigationController()
    }

    // MARK: - Public Methods
    public func start() {
        let communitiesViewController = CommunitiesViewController()
        let tabBarItem = TabBarItem.communities

        communitiesViewController.title = tabBarItem.title
        communitiesViewController.tabBarItem = UITabBarItem(title: tabBarItem.title, image: tabBarItem.image, selectedImage: tabBarItem.selectedImages)
        navigationController.setViewControllers([communitiesViewController], animated: true)
    }
}

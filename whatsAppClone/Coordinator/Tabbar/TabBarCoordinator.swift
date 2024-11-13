//
//  TabbarCoordinator.swift
//  whatsAppClone
//
//  Created by Rafael on 11/11/24.
//

import Foundation
import UIKit


final class TabBarCoordinator: CoordinatorProtocol {
    
    // MARK: - Private Propertites
    private(set) var navigationController: UINavigationController

    // MARK: - Initialized
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Public Methods
    public func start() {
        let tabBarController = TabBarController()

        tabBarController.setViewControllers(configureCoordinatorTabBar(), animated: true)
        tabBarController.selectedIndex = 3
        navigationController.setViewControllers([tabBarController], animated: true)
    }

    // MARK: - Private Methods
    private func configureCoordinatorTabBar() -> [UIViewController] {
        var viewControllers: [UIViewController] = []

        let updatesCoordinator = UpdatesCoordinator()
        let callsCoordinator = CallsCoordinator()
        let communitiesCoordinator = CommunitiesCoordinator()
        let chatsCoordinator = ChatsCoordinator()
        let settingsCoordinator = SettingsCoordinator()

        viewControllers.append(updatesCoordinator.navigationController)
        viewControllers.append(callsCoordinator.navigationController)
        viewControllers.append(communitiesCoordinator.navigationController)
        viewControllers.append(chatsCoordinator.navigationController)
        viewControllers.append(settingsCoordinator.navigationController)

        updatesCoordinator.start()
        callsCoordinator.start()
        communitiesCoordinator.start()
        chatsCoordinator.start()
        settingsCoordinator.start()

        return viewControllers
    }
}

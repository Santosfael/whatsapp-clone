//
//  AppCoordinator.swift
//  whatsAppClone
//
//  Created by Rafael on 11/11/24.
//

import Foundation
import UIKit

final class AppCoordinator: CoordinatorProtocol {

    // MARK: - Private Propertites
    private(set) var navigationController: UINavigationController
    private let window: UIWindow
    private var isUserLoggedIn: Bool

    // MARK: - Initialized
    init(navigationController: UINavigationController,
         window: UIWindow,
         isUserLoggedIn: Bool) {
        self.navigationController = navigationController
        self.window = window
        self.isUserLoggedIn = isUserLoggedIn
    }

    // MARK: - Public Methods
    public func start() {
        if isUserLoggedIn {
            showMainTabBar()
        } else {
            // TODO: Desenvolver a parte de login
        }
    }

    // MARK: - Private Methods
    private func showMainTabBar() {
        let tabBarCoordinator = TabBarCoordinator(navigationController: navigationController)
        tabBarCoordinator.start()
        window.rootViewController = navigationController
        navigationController.navigationBar.barTintColor = .white
        window.makeKeyAndVisible()
    }
}

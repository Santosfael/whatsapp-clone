//
//  ChatsCoordinator.swift
//  whatsAppClone
//
//  Created by Rafael on 12/11/24.
//

import Foundation
import UIKit

final class ChatsCoordinator: CoordinatorProtocol {

    // MARK: - Public Propertites
    public var navigationController: UINavigationController

    // MARK: - Initialized
    init() {
        self.navigationController = UINavigationController()
    }

    // MARK: - Public Methods
    public func start() {
        let service = WhatsAppService()
        let viewModel = ChatsViewModel(whatsAppService: service)
        let tabBarItem = TabBarItem.chats
        let chatsViewController = ChatsViewController()

        chatsViewController.viewModel = viewModel
        chatsViewController.title = tabBarItem.title
        chatsViewController.tabBarItem = UITabBarItem(title: tabBarItem.title, image: tabBarItem.image, selectedImage: tabBarItem.selectedImages)
        navigationController.setViewControllers([chatsViewController], animated: true)
    }
}

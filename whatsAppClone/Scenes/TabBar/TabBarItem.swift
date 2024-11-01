//
//  TabBarItem.swift
//  whatsAppClone
//
//  Created by Rafael on 14/10/24.
//

import UIKit

enum TabBarItem {

    // MARK: - Cases
    case updates
    case calls
    case communities
    case chats
    case settings

    // MARK: - ViewControllers
    var viewController: UIViewController {
        switch self {
        case .updates:
            return UINavigationController(rootViewController: UpdatesViewController())
        case .calls:
            return UINavigationController(rootViewController: CallViewController())
        case .communities:
            return UINavigationController(rootViewController: CommunitiesViewController())
        case .chats:
            let service = WhatsAppService()
            let viewModel = ChatsViewModel(whatsAppService: service)
            let chatsViewController = ChatsViewController()
            chatsViewController.viewModel = viewModel
            return UINavigationController(rootViewController: chatsViewController)
        case .settings:
            return UINavigationController(rootViewController: SettingsViewController())
        }
    }

    // MARK: - Titles
    var title: String {
        switch self {
        case .updates:
            return "Updates"
        case .calls:
            return "Calls"
        case .communities:
            return "Communities"
        case .chats:
            return "Chats"
        case .settings:
            return "Settings"
        }
    }

    // MARK: - Images
    var image: UIImage? {
        switch self {
        case .updates:
            return Images.status
        case .calls:
            return Images.phone
        case .communities:
            return Images.communities
        case .chats:
            return Images.chats
        case .settings:
            return Images.gear
        }
    }

    // MARK: Selected Images
    var selectedImages: UIImage? {
        switch self {
        case .updates:
            return Images.statusFill
        case .calls:
            return Images.phoneFill
        case .communities:
            return Images.communitiesFill
        case .chats:
            return Images.chatsFill
        case .settings:
            return Images.gearFill
        }
    }
}

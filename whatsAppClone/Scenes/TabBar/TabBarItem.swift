//
//  TabBarItem.swift
//  whatsAppClone
//
//  Created by Rafael on 14/10/24.
//

import UIKit

enum TabBarItem {
    case updates
    case calls
    case communities
    case chats
    case settings

    var viewController: UIViewController {
        switch self {
        case .updates:
            return UINavigationController(rootViewController: UpdatesViewController())
        case .calls:
            return UINavigationController(rootViewController: CallViewController())
        case .communities:
            return UINavigationController(rootViewController: CommunitiesViewController())
        case .chats:
            return UINavigationController(rootViewController: ChatsViewController())
        case .settings:
            return UINavigationController(rootViewController: SettingsViewController())
        }
    }

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

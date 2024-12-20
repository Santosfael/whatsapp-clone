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

    // MARK: - Titles
    var title: String {
        switch self {
        case .updates:
            return "UpdatesNavigationTitle".localized()
        case .calls:
            return "CallsNavigationTitle".localized()
        case .communities:
            return "CommunitiesNavigationTitle".localized()
        case .chats:
            return "ChatsNavigationTitle".localized()
        case .settings:
            return "SettingsNavigationTitle".localized()
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

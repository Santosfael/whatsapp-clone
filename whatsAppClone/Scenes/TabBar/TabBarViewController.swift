//
//  HomeTabBarViewController.swift
//  whatsAppClone
//
//  Created by Rafael on 14/10/24.
//

import UIKit

class UpdatesViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        title = "Updates"
    }
}

class CallViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .orange
        title = "Calls"
    }
}

class CommunitiesViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        title = "Communiteis"
    }
}

class SettingsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        title = "Settings"
    }
}

class TabBarViewController: UITabBarController {

    // MARK: - Filescycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarController()
    }

    // MARK: - Private Methods
    /// Setup tab bar
    private func setupTabBarController() {
        let tabBars: [TabBarItem] = [.updates, .calls, .communities, .chats, .settings]

        let viewControllers = tabBars.map { tab -> UIViewController in
            let viewController = tab.viewController
            viewController.tabBarItem = UITabBarItem(title: tab.title, image: tab.image, selectedImage: tab.selectedImages)
            return viewController
        }
        self.setViewControllers(viewControllers, animated: true)
        self.selectedIndex = 3
        setupTabBarAppearance()
    }

    /// Appearance
    private func setupTabBarAppearance() {
        self.tabBar.backgroundColor = Colors.surfacePanel
        self.tabBar.tintColor = Colors.iconTabBarSelected
        self.tabBar.unselectedItemTintColor = Colors.iconTabBar
        let lineView = UIView(frame: CGRect(x: 0, y: 0, width: self.tabBar.frame.size.width, height: 0.5))
        lineView.backgroundColor = Colors.borderPanel
        self.tabBar.addSubview(lineView)
    }
}

//
//  TabBarController.swift
//  whatsAppClone
//
//  Created by Rafael on 14/10/24.
//

import UIKit

class UpdatesViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
}

class CallViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .orange
    }
}

class CommunitiesViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
    }
}

class SettingsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
    }
}

class TabBarController: UITabBarController {

    // MARK: - Filescycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarAppearance()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    // MARK: - Private Methods
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

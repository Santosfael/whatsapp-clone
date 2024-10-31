//
//  ViewController.swift
//  whatsAppClone
//
//  Created by Rafael on 13/10/24.
//

import UIKit

class ChatsViewController: UIViewController {

    // MARK: - Private Properties
    private let content = ChatsView()
    private let buttonsNavigation = CustomButtonsView()
    private lazy var searchController = UISearchController(searchResultsController: nil)

    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        view = content
        content.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Chats"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        configureNavigationBar()
    }

    // MARK: - deinit
    deinit {
        navigationController?.navigationBar.prefersLargeTitles = false
    }

    // MARK: - Private Methods
    private func configureNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = buttonsNavigation.addBarButtonsItems(buttonTypes: [.primaryButton(image: Images.cameraFill, backgroundColor: Colors.backgroundGrayLight8), .secondaryButton(image: Images.plusFill)])
        navigationItem.leftBarButtonItem = buttonsNavigation.addBarButtonsItems(buttonTypes: [.primaryButton(image: Images.meetballMenu)])
        navigationItem.searchController = searchController
        appearanceNavigationBar()
    }

    private func appearanceNavigationBar() {
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: Colors.secondaryColor
        ], for: .normal)
    }

    @objc private func popupInfo() {
        print("cliquei")
    }
}

// MARK: - Custom Extension
extension ChatsViewController: ChatsViewControllerDelegate {
    func chatMessageUser(user: Talk) {
        let messagesViewController = MessagesViewController(user: user)
        navigationController?.pushViewController(messagesViewController, animated: true)
    }
}

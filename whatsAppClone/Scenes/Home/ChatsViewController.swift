//
//  ViewController.swift
//  whatsAppClone
//
//  Created by Rafael on 13/10/24.
//

import UIKit

class ChatsViewController: UIViewController {

    // MARK: - Private variables
    private let content = ChatsView()
    private let buttonsNavigation = CustomButtonsView()
    private lazy var searchController = UISearchController(searchResultsController: nil)

    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        view = content
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Chats"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
    }

    // MARK: - Private Methods actions
    private func configureNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = buttonsNavigation.addBarButtonsItems(buttonTypes: [.primaryButton(image: Images.cameraFill), .secondaryButton(image: Images.plusFill)])
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


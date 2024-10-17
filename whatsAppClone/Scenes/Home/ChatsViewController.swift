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
    private let buttonsNavigation = RightBarButtonsBarView()

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
        navigationItem.rightBarButtonItem = buttonsNavigation.addRightBarButtonsItems(buttonTypes: [.primaryButton(image: Images.cameraFill), .secondaryButton(image: Images.plusFill)])
        navigationItem.leftBarButtonItem = buttonsNavigation.addRightBarButtonsItems(buttonTypes: [.primaryButton(image: Images.meetballMenu)])
    }

    @objc private func popupInfo() {
        print("cliquei")
    }
}


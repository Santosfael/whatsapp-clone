//
//  MessagesViewController.swift
//  whatsAppClone
//
//  Created by Rafael on 22/10/24.
//

import UIKit

class MessagesViewController: UIViewController {

    // MARK: - Private properties
    private let buttonsNavigation = CustomButtonsView()
    private let customGroupPhotoAndNameNavigationBar = CustomGroupPhotoNameNavigationBarView()
    private let messagesView = MessagesView()
    private var user: Talk?

    // MARK: Lifecicly
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureAppearanceBar()
        self.navigationItem.largeTitleDisplayMode = .never
        self.view = messagesView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.backgroundColor = Colors.surfacePanel
        self.navigationItem.largeTitleDisplayMode = .always
    }

    // MARK: - Initialized
    init(user: Talk) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
        customGroupPhotoAndNameNavigationBar.configurationNameAndPhoto(imageUrl: user.picture, title: user.name)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods actions
    private func configureNavigationBar() {

        navigationItem.rightBarButtonItem = buttonsNavigation.addBarButtonsItems(buttonTypes: [.defaultButton(image: Images.video, targetSize: CGSize(width: 32, height: 32), tintColor: Colors.iconPrimary), .defaultButton(image: Images.phone, targetSize: CGSize(width: 32, height: 32), tintColor:  Colors.iconPrimary)])

        navigationItem.leftBarButtonItems = [
            UIBarButtonItem(image: Images.chevronLeft,
                            style: .plain,
                            target: self,
                            action: #selector(backButtonTapped)),
            UIBarButtonItem(customView: customGroupPhotoAndNameNavigationBar)
        ]
        navigationItem.leftBarButtonItem?.tintColor = Colors.iconPrimary
    }

    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }

    // MARK: - Private Methods
    private func configureAppearanceBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = Colors.surfacePanel
        self.navigationItem.standardAppearance = appearance
        self.navigationItem.scrollEdgeAppearance = appearance
    }
}

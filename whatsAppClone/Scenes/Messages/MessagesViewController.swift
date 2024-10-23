//
//  MessagesViewController.swift
//  whatsAppClone
//
//  Created by Rafael on 22/10/24.
//

import UIKit

class MessagesViewController: UIViewController {
    private let buttonsNavigation = CustomButtonsView()
    private let customGroupPhotoAndNameNavigationBar = CustomGroupPhotoNameNavigationBarView()
    private var user: Talk?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        configureNavigationBar()
    }

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
        navigationItem.rightBarButtonItem = buttonsNavigation.addBarButtonsItems(buttonTypes: [.defaultButton(image: Images.video, targetSize: CGSize(width: 32, height: 32), tintColor: Colors.secondaryColor), .defaultButton(image: Images.phone, targetSize: CGSize(width: 32, height: 32), tintColor:  Colors.secondaryColor)])

        navigationItem.leftBarButtonItems = [
            UIBarButtonItem(image: Images.chevronLeft,
                            style: .plain,
                            target: self,
                            action: #selector(backButtonTapped)),
            UIBarButtonItem(customView: customGroupPhotoAndNameNavigationBar)
        ]
        navigationItem.leftBarButtonItem?.tintColor = Colors.secondaryColor
    }

    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

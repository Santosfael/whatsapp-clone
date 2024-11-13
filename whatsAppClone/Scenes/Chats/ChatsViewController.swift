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

    private var numberUnreadTalk: String = "" {
        didSet {
            DispatchQueue.main.sync {
                self.configureTabBarController()
            }
        }
    }

    // MARK: - Public Properties
    public var viewModel: ChatsViewModelProtocol?

    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        view = content
        content.delegate = self
        content.getTalks()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
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
        navigationItem.rightBarButtonItem = buttonsNavigation.addBarButtonsItems(buttonTypes: [.primaryButton(image: Images.cameraFill, backgroundColor: Colors.surfaceCtaCircular), .secondaryButton(image: Images.plusFill)])
        navigationItem.leftBarButtonItem = buttonsNavigation.addBarButtonsItems(buttonTypes: [.primaryButton(image: Images.meetballMenu, backgroundColor: Colors.surfaceCtaCircular)])
        navigationItem.searchController = searchController
        appearanceNavigationBar()
    }

    private func configureTabBarController() {
        guard let textInvertColor = Colors.textInvert else { return }
        tabBarController?.tabBar.items?[3].badgeValue = numberUnreadTalk
        tabBarController?.tabBar.items?[3].badgeColor = Colors.surfaceProduct
        tabBarController?.tabBar.items?[3].setBadgeTextAttributes([NSAttributedString.Key.foregroundColor: textInvertColor], for: .normal)
    }

    private func appearanceNavigationBar() {
        let appearance = UINavigationBarAppearance()
        guard let textPrimaryColor = Colors.textPrimary else { return }
        appearance.titleTextAttributes = [.foregroundColor: textPrimaryColor]
        appearance.backgroundColor = .systemBackground
        appearance.largeTitleTextAttributes = [.foregroundColor: textPrimaryColor]

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
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

    func listChats(completion: @escaping completion){
        viewModel?.listChat(handler: completion)
    }

    func listUnreadTalk(talks: [Talk], filter: String) -> [Talk]? {
        return viewModel?.listUnreadChat(talks: talks, filter: filter)
    }

    func getNumberUnreadTalk(numberUnread: Int) {
        numberUnreadTalk = "\(numberUnread)"
    }
}

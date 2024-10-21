//
//  HomeView.swift
//  whatsAppClone
//
//  Created by Rafael on 13/10/24.
//

import UIKit

class ChatsView: UIView {

    // MARK: - Private variables
    private var setIsHiddenCollection = true

    //MARK: - Private Closures
    private lazy var chatsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    private let filterHeaderView = FilterChatCollectionView()

    private lazy var talks = [Talk]() {
        didSet {
            DispatchQueue.main.async {
                self.chatsTableView.reloadData()
            }
        }
    }

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Privates Methods
    private func getTalks() {
        Service.shared.getChat { result in
            switch result {
            case .success(let response):
                self.talks = response
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    private func configureHeaderTableView() {
        filterHeaderView.frame = CGRect(x: 0, y: 0, width: frame.width, height: 50)
        filterHeaderView.editAlphaCollectionView(alpha: 1)
        chatsTableView.tableHeaderView = filterHeaderView
    }
}

// MARK: - Extension Custom
extension ChatsView: ViewCode {
    func buildHierachy() {
        addSubviews(chatsTableView)
    }
    
    func setupConstrants() {
        NSLayoutConstraint.activate([
            chatsTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            chatsTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            chatsTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            chatsTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func applyAdditionalChanges() {
        backgroundColor = .systemBackground
        chatsTableView.delegate = self
        chatsTableView.dataSource = self

        chatsTableView.register(ChatTableViewCell.self, forCellReuseIdentifier: ChatTableViewCell.identifier)
        getTalks()
    }
}

// MARK: - Extensions UITableView
extension ChatsView: UITableViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentSize.width > 100 {
            if setIsHiddenCollection {
            } else {
                UIView.animate(withDuration: 0.2) {
                    self.configureHeaderTableView()
                }
            }
            setIsHiddenCollection = filterHeaderView.setIsHiddenCollection(isHidden: false)
        }
    }
}

extension ChatsView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return talks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.identifier, for: indexPath) as? ChatTableViewCell else { return UITableViewCell() }
        let talk = talks[indexPath.row]
        cell.updateDataTalk(talk: talk)
        return cell
    }
}

//
//  HomeView.swift
//  whatsAppClone
//
//  Created by Rafael on 13/10/24.
//

import UIKit

class ChatsView: UIView {

    // MARK: - Private Propertie
    private var setIsHiddenCollection = true
    private let filterHeaderView = FilterChatCollectionView()
    private let footerTableView = FooterTableView()

    private lazy var talks = [Talk]() {
        didSet {
            DispatchQueue.main.async {
                self.chatsTableView.reloadData()
            }
        }
    }

    private lazy var talksTemp = [Talk]() {
        didSet {
            DispatchQueue.main.async {
                self.chatsTableView.reloadData()
            }
        }
    }

    // MARK: - Private UI Components
    private lazy var chatsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()

    // MARK: - Delegate
    weak var delegate: ChatsViewControllerDelegate?

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods
    public func getTalks() {
        delegate?.listChats(completion: { result in
            switch result {
            case .success(let talks):
                self.talks = talks
                self.talksTemp = talks
                self.delegate?.getNumberUnreadTalk(numberUnread: talks.filter({$0.unread == true}).count)
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }

    // MARK: - Privates Methods
    private func configureTableView() {
        chatsTableView.delegate = self
        chatsTableView.dataSource = self

        chatsTableView.register(ChatTableViewCell.self, forCellReuseIdentifier: ChatTableViewCell.identifier)
    }

    private func configureHeaderTableView() {
        filterHeaderView.frame = CGRect(x: 0, y: 0, width: frame.width, height: 50)
        filterHeaderView.editAlphaCollectionView(alpha: 1)
        chatsTableView.tableHeaderView = filterHeaderView
    }

    private func configureFooterTableView() {
        footerTableView.frame = CGRect(x: 0, y: chatsTableView.frame.height, width: frame.width, height: 100)
        chatsTableView.tableFooterView = footerTableView
    }
}

// MARK: - Custom Extension
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
        backgroundColor = Colors.surfacePrimary
        configureTableView()
        configureFooterTableView()
        filterHeaderView.delegate = self
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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.chatMessageUser(user: talks[indexPath.row])
    }
}

// MARK: - Custom Extension Filter Chat
extension ChatsView: FilterChatCollectionViewDelegate {
    func filterChat(filter: String) {
        if let talks = delegate?.listUnreadTalk(talks: talksTemp, filter: filter) {
            self.talks = talks
        }
    }
}

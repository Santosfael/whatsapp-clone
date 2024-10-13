//
//  HomeView.swift
//  whatsAppClone
//
//  Created by Rafael on 13/10/24.
//

import UIKit

class HomeView: UIView {

    private lazy var chartsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    private lazy var talks = [Talk]() {
        didSet {
            DispatchQueue.main.async {
                self.chartsTableView.reloadData()
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

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
}

extension HomeView: ViewCode {
    func buildHierachy() {
        addSubview(chartsTableView)
    }
    
    func setupConstrants() {
        NSLayoutConstraint.activate([
            chartsTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            chartsTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            chartsTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            chartsTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func applyAdditionalChanges() {
        backgroundColor = .systemBackground
        chartsTableView.delegate = self
        chartsTableView.dataSource = self

        chartsTableView.register(ChatTableViewCell.self, forCellReuseIdentifier: ChatTableViewCell.identifier)
        getTalks()
    }
}

extension HomeView: UITableViewDelegate {}

extension HomeView: UITableViewDataSource {
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

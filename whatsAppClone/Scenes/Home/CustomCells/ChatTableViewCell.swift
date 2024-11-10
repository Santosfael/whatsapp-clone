//
//  ChatTableViewCell.swift
//  whatsAppClone
//
//  Created by Rafael on 13/10/24.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    // MARK: - Static Propertie
    static let identifier = "ChatTableViewCell"

    // MARK: - Private UI Components
    private lazy var personImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "person")
        image.layer.cornerRadius = 26
        image.layer.masksToBounds = true
        return image
    }()

    private lazy var containerVerticalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 11
        stack.contentMode = .top
        return stack
    }()

    private lazy var containerNameAndDateHorizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.contentMode = .center
        return stack
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.text = "Rafael"
        label.textColor = Colors.textPrimary
        return label
    }()

    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = Colors.textSecondary
        label.text = "11/01/2022"
        return label
    }()

    private lazy var talkLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = Colors.textSecondary
        label.numberOfLines = 2
        label.text = "Actually I wanted to check with you about your online business plan on our textexte raafaf taasad"
        return label
    }()

    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods
    public func updateDataTalk(talk: Talk) {
        personImageView.loadImage(from: talk.picture)
        nameLabel.text = talk.name
        dateLabel.text = talk.latest_timestamp
        talkLabel.text = talk.lastChat
        if talk.unread == true {
            dateLabel.textColor = Colors.textProduct
        } else if talk.unread == false {
            dateLabel.textColor = Colors.textSecondary
        }
    }
}

// MARK: - Custom Extension
extension ChatTableViewCell: ViewCode {
    func buildHierachy() {
        addSubviews(personImageView, containerVerticalStack)
        containerVerticalStack.addArrangedSubviews(containerNameAndDateHorizontalStack, talkLabel)
        containerNameAndDateHorizontalStack.addArrangedSubviews(nameLabel, dateLabel)
    }
    
    func setupConstrants() {
        NSLayoutConstraint.activate([
            // Image View
            personImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            personImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            personImageView.widthAnchor.constraint(equalToConstant: 52),
            personImageView.heightAnchor.constraint(equalToConstant: 52),

            // Vertical Stack
            containerVerticalStack.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            containerVerticalStack.leadingAnchor.constraint(equalTo: personImageView.trailingAnchor, constant: 12),
            containerVerticalStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            containerVerticalStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
    
    func applyAdditionalChanges() {
    }
}

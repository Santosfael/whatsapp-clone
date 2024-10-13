//
//  ChatTableViewCell.swift
//  whatsAppClone
//
//  Created by Rafael on 13/10/24.
//

import UIKit

class ChatTableViewCell: UITableViewCell {
    static let identifier = "ChatTableViewCell"

    // MARK: - private variables
    private lazy var personImage: UIImageView = {
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
        return label
    }()

    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.text = "11/01/2022"
        return label
    }()

    private lazy var talkLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.numberOfLines = 2
        label.text = "Actually I wanted to check with you about your online business plan on our textexte raafaf taasad"
        return label
    }()

    // MARK: - Initializes
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions
extension ChatTableViewCell: ViewCode {
    func buildHierachy() {
        addSubviews(personImage, containerVerticalStack)
        containerVerticalStack.addArrangedSubviews(containerNameAndDateHorizontalStack, talkLabel)
        containerNameAndDateHorizontalStack.addArrangedSubviews(nameLabel, dateLabel)
    }
    
    func setupConstrants() {
        NSLayoutConstraint.activate([
            /// Image
            personImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            personImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            personImage.widthAnchor.constraint(equalToConstant: 52),
            personImage.heightAnchor.constraint(equalToConstant: 52),

            /// Vertical Stack
            containerVerticalStack.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            containerVerticalStack.leadingAnchor.constraint(equalTo: personImage.trailingAnchor, constant: 12),
            containerVerticalStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -35),
            containerVerticalStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
    
    func applyAdditionalChanges() {
        accessoryType = .disclosureIndicator
    }
    

}

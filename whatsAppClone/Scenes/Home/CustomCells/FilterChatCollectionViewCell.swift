//
//  FilterChatCollectionViewCell.swift
//  whatsAppClone
//
//  Created by Rafael on 20/10/24.
//

import UIKit

class FilterChatCollectionViewCell: UICollectionViewCell {

    // MARK: - Static Propertie
    static let identifier = "FilterChatCollectionViewCell"

    // MARK: - Private UI Components
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Initialized
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods
    public func setSelectedState(isSelected: Bool) {
        if isSelected {
            contentView.backgroundColor = Colors.backgroundGreenLight
            titleLabel.textColor = Colors.textColorGreen
        } else {
            contentView.backgroundColor = Colors.backgroundGrayLight
            titleLabel.textColor = Colors.textColorGrayLight
        }
    }

    public func configure(with title: String) {
        titleLabel.text = title
    }
}

// MARK: - Custom Extension
extension FilterChatCollectionViewCell: ViewCode {
    func buildHierachy() {
        contentView.addSubview(titleLabel)
    }

    func setupConstrants() {
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 14),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -14)
        ])
    }

    func applyAdditionalChanges() {
        contentView.layer.cornerRadius = 19
        contentView.layer.masksToBounds = true
    }
}

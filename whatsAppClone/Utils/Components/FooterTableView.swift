//
//  FoolterTableView.swift
//  whatsAppClone
//
//  Created by Rafael on 22/10/24.
//

import UIKit

final class FooterTableView: UIView {

    // MARK: - Private Clousure
    private lazy var lockImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "lock.fill")
        image.tintColor = Colors.primaryColor
        return image
    }()

    private lazy var infoEncryptLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Your personal messages are"
        label.textColor = Colors.primaryColor
        label.font = UIFont.systemFont(ofSize: 11)
        return label
    }()

    private lazy var endToEndEncryptedButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("end-to-end encrypted.", for: .normal)
        button.setTitleColor(Colors.ternaryColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        button.addTarget(self, action: #selector(encryptInfo), for: .touchUpInside)
        return button
    }()

    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 1
        stackView.alignment = .center
        return stackView
    }()

    // MARK: - Initializeds
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Actions Button
    @objc private func encryptInfo() {}
}

// MARK: - Extension Custom
extension FooterTableView: ViewCode {
    func buildHierachy() {
        contentStackView.addArrangedSubviews(lockImage, infoEncryptLabel, endToEndEncryptedButton)
        addSubview(contentStackView)
    }

    func setupConstrants() {
        NSLayoutConstraint.activate([
            lockImage.widthAnchor.constraint(equalToConstant: 12),
            lockImage.heightAnchor.constraint(equalToConstant: 12),

            contentStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            contentStackView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            contentStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -59)
        ])
    }

    func applyAdditionalChanges() {
    }
}

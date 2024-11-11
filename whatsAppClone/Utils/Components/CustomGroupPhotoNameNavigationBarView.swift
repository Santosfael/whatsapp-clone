//
//  CustomGroupPhotoNameNavigationBarView.swift
//  whatsAppClone
//
//  Created by Rafael on 23/10/24.
//

import UIKit

class CustomGroupPhotoNameNavigationBarView: UIView {

    // MARK: - Private UI Components
    private lazy var photoImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 18
        image.layer.masksToBounds = true
        return image
    }()

    private lazy var profileButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.tintColor = Colors.textPrimary
        if #available(iOS 15.0, *) {
            button.subtitleLabel?.text = "tap here for contact info"
            button.subtitleLabel?.textColor = Colors.textSecondaryAlpha
            button.subtitleLabel?.font = UIFont.systemFont(ofSize: 12)
        }
        return button
    }()

    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .center
        return stackView
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
    public func configurationNameAndPhoto(imageUrl: String?, title: String) {
        guard let imageUrl = imageUrl else { return }
        photoImageView.loadImage(from: imageUrl)
        profileButton.setTitle(title, for: .normal)
    }
}

// MARK: - Custom Extension
extension CustomGroupPhotoNameNavigationBarView: ViewCode {
    func buildHierachy() {
        contentStackView.addArrangedSubviews(photoImageView, profileButton)
        addSubviews(contentStackView)
    }

    func setupConstrants() {
        NSLayoutConstraint.activate([
            // Photo image
            photoImageView.widthAnchor.constraint(equalToConstant: 32),
            photoImageView.heightAnchor.constraint(equalToConstant: 32),

            // Stack View
            contentStackView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }

    func applyAdditionalChanges() {
    }
}

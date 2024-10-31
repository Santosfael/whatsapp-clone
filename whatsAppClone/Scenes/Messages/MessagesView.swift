//
//  MessagesView.swift
//  whatsAppClone
//
//  Created by Rafael on 23/10/24.
//

import UIKit

class MessagesView: UIView {

    // MARK: - Private Properties
    private var bottomConstraint: NSLayoutConstraint?

    // MARK: - Private UI Components
    private lazy var plusImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = Images.plus
        image.tintColor = UIColor.black
        return image
    }()

    private lazy var messageTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .line
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 15
        textField.layer.masksToBounds = true
        textField.leftViewMode = .always
        textField.leftView = .init(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.layer.borderColor = Colors.borderColor.cgColor

        let button = UIButton(type: .custom)
        textField.rightViewMode = .always
        return textField
    }()

    private lazy var stickerButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(Images.sticker, for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        button.frame = CGRect(x: CGFloat(messageTextField.frame.size.width - 25), y: CGFloat(5), width: CGFloat(24), height: CGFloat(24))
        return button
    }()

    private lazy var cameraImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = Images.camera
        image.tintColor = Colors.ternaryColor
        return image
    }()

    private lazy var micImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = Images.mic
        image.tintColor = Colors.ternaryColor
        return image
    }()

    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.contentMode = .center
        stackView.spacing = 8
        stackView.axis = .horizontal
        return stackView
    }()

    /// View que irá conter os botões camera, mic, sticker, plus  e o messageTextfield
    private lazy var contentMessageView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.backgroundGrayLight
        return view
    }()

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupKeyboardHiding()
        setupView()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Privates Methods
    private func setupKeyboardHiding() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    // MARK: - Private Methods Actions
    @objc private func keyboardWillShow(sender: Notification) {
        guard let userInfo = sender.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }

        let keyboardHeight = keyboardFrame.cgRectValue.height
        bottomConstraint?.constant = -keyboardHeight
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
    }

    @objc private func keyboardWillHide(sender: Notification) {
        bottomConstraint?.constant = 0
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
    }

    // MARK: - Deinit
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

// MARK: - Custom Extension
extension MessagesView: ViewCode {
    func buildHierachy() {
        addSubview(contentMessageView)
        contentStackView.addArrangedSubviews(plusImage, messageTextField, cameraImage, micImage)
        contentMessageView.addSubview(contentStackView)
    }

    func setupConstrants() {
        bottomConstraint = contentMessageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        NSLayoutConstraint.activate([
            // Content Message
            contentMessageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            contentMessageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            // Altera o bootm da contentMessageView caso o teclado apareca
            bottomConstraint ?? contentMessageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentMessageView.heightAnchor.constraint(equalToConstant: 76),

            // Icon Image
            plusImage.widthAnchor.constraint(equalToConstant: 32),
            plusImage.heightAnchor.constraint(equalToConstant: 32),

            // Content Stack View
            contentStackView.topAnchor.constraint(equalTo: contentMessageView.topAnchor, constant: 10),
            contentStackView.leadingAnchor.constraint(equalTo: contentMessageView.leadingAnchor, constant: 7),
            contentStackView.trailingAnchor.constraint(equalTo: contentMessageView.trailingAnchor,constant: -7),
        ])
    }

    func applyAdditionalChanges() {
        messageTextField.rightView = stickerButton
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = Images.chatBackgroundImage
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.backgroundColor = Colors.chatBackgroundColor
        self.insertSubview(backgroundImage, at: 0)
        messageTextField.delegate = self
    }
}

// MARK: - Extensions TextField
extension MessagesView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        messageTextField.resignFirstResponder()
        return true
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }
}

//
//  ChatViewController.swift
//  ChatApp
//
//  Created by Taha Turan on 12.09.2023.
//

import UIKit

class ChatViewController: UIViewController {
    // MARK: - Properties

    private var userModel: UserModel

    // ChatTextField
    private let messageTextField: MessageTextField = MessageTextField()
    private lazy var messageContainerView = ChatMessageTextFieldInputView(textField: messageTextField)

    // MARK: - LyfeCycle

    init(user: UserModel) {
        userModel = user
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        layout()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Helpers

extension ChatViewController {
    private func setupUI() {
        navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = K.Colors.superSilver
        configureSetupKeyboard()
        messageContainerView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func layout() {
        view.addSubview(messageContainerView)

        NSLayoutConstraint.activate([
            messageContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            messageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            messageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            messageContainerView.heightAnchor.constraint(equalToConstant: K.Size.messageContainerViewHeight),

        ])
    }

    // Configire Keyboard
    private func configureSetupKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillShowNotification), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillHideNotification), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

// MARK: - Selector

extension ChatViewController {
    @objc private func handleKeyboardWillShowNotification() {
        view.frame.origin.y = -290
    }

    @objc private func handleKeyboardWillHideNotification() {
        view.frame.origin.y = 0
    }

    @objc private func handleTap() {
        view.endEditing(true)
    }
}

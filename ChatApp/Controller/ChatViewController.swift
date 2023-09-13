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
    private lazy var messageContainerView = ChatInputView()
    
    //TableView
    private let tableView: UITableView = UITableView()

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
        messageContainerView.delagate = self
        tableView.delegate = self
        tableView.dataSource = self
        navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = K.Colors.superSilver
        configureSetupKeyboard()
        messageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        //tableView
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MessageTableViewCell.self, forCellReuseIdentifier: K.TableViewCellIdentifier.messageCell)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 60
        
        tableView.separatorStyle = .none
        tableView.allowsSelection = false

    }

    private func layout() {
        view.addSubview(tableView)
        view.addSubview(messageContainerView)
        
        NSLayoutConstraint.activate([
            //MessageTextView
            messageContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            messageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            messageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            messageContainerView.heightAnchor.constraint(equalToConstant: K.Size.messageContainerViewHeight),
            messageContainerView.topAnchor.constraint(equalTo: tableView.bottomAnchor),
            
            //TableView
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: messageContainerView.topAnchor)
            

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


//MARK: - UITableViewDelegate/DataSource
extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.TableViewCellIdentifier.messageCell, for: indexPath) as! MessageTableViewCell
        
        return cell
    }
    
    
}

extension ChatViewController: ChatInputViewProtocol {
    
    func sendMessage(_ ChatMessageTextFieldInputView: ChatInputView, message: String) {
        
        Service.sendMessage(message: message, toUser: userModel) { error in
            if let error = error {
                print(error.localizedDescription) // Error alert eklenecek
                return
            }
        }
    }
    
    
}

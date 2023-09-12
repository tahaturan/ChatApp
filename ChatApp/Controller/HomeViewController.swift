//
//  HomeViewController.swift
//  ChatApp
//
//  Created by Taha Turan on 9.09.2023.
//

import FirebaseAuth
import UIKit

class HomeViewController: UIViewController {
    // MARK: - Properties

    private let newMessageView = NewMessageViewController()
    private var newMessageButton: UIBarButtonItem = UIBarButtonItem()
    private var profileButton: UIBarButtonItem = UIBarButtonItem()

    // MARK: - Lyfecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        newMessageView.delegate = self
        authenticationStatus()
        style()
        layout()
    }
}

// MARK: - Helpers

extension HomeViewController {
    private func authenticationStatus() {
        if Auth.auth().currentUser?.uid == nil {
            DispatchQueue.main.async {
                let controller = UINavigationController(rootViewController: LoginViewController())
                controller.modalPresentationStyle = .fullScreen
                self.present(controller, animated: true)
            }
        }
    }

    // SignOut
    private func signOut() {
        do {
            try Auth.auth().signOut()
            authenticationStatus()
        } catch {
        }
    }

    // Style
    private func style() {
        view.backgroundColor = K.Colors.superSilver
        navigationItem.title = K.StringText.chats
        configureNavigationBar()
    }

    // ConfigureNavigationBar
    private func configureNavigationBar() {
        navigationController?.navigationBar.tintColor = K.Colors.superSilver
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true

        newMessageButton = UIBarButtonItem(image: UIImage(systemName: K.Icons.newMessageIcon), style: .plain, target: self, action: #selector(handleNewMessageButton))
        profileButton = UIBarButtonItem(image: UIImage(systemName: K.Icons.profileIcon), style: .plain, target: self, action: #selector(handleProfileButton))

        navigationItem.rightBarButtonItem = newMessageButton
        navigationItem.leftBarButtonItem = profileButton
    }

    // Layout
    private func layout() {
    }
}

// MARK: - Selector

extension HomeViewController {
    @objc private func handleNewMessageButton() {
        navigationController?.present(newMessageView, animated: true)
    }

    @objc private func handleProfileButton() {
    }
}

// MARK: - NewMessageViewControllerProtocol

extension HomeViewController: NewMessageViewControllerProtocol {
    func goToChatView(user: UserModel) {
        let controller = ChatViewController(user: user)
        navigationController?.pushViewController(controller, animated: true)
    }
}

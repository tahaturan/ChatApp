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
    private var lastUsers: [LastUser] = []
    
    private let newMessageView = NewMessageViewController()
    private var newMessageButton: UIBarButtonItem = UIBarButtonItem()
    private var profileButton: UIBarButtonItem = UIBarButtonItem()
    private var tableView: UITableView = UITableView()

    // MARK: - Lyfecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        newMessageView.delegate = self
        authenticationStatus()
        fetchLastUsers()
        style()
        layout()
    }
    //MARK: - Service
    
    private func fetchLastUsers() {
        Service.fetchLastUsers { lastUser, error in
            if error != nil {
                print(error!.localizedDescription) // Alert eklenecek
            }else {
                self.lastUsers = lastUser ?? []
                self.tableView.reloadData()
            }
        }
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
        //TableView
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = K.Size.tableViewRowHeight
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: K.TableViewCellIdentifier.homeViewCell)
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
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        ])
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


//MARK: -UITableViewDelegate / UITableViewDataSource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.lastUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellPath = K.TableViewCellIdentifier.homeViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: cellPath , for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
    
}

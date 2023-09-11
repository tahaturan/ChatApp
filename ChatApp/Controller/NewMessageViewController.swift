//
//  NewMessageViewController.swift
//  ChatApp
//
//  Created by Taha Turan on 11.09.2023.
//

import UIKit

class NewMessageViewController: UIViewController {
    //MARK: - Properties
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.text = K.StringText.newChat
        label.textColor = K.Colors.superSilver
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let dividerView: UIView = {
       let divider = UIView()
        divider.backgroundColor = K.Colors.superSilver
        return divider
    }()
    
    private let tableView = UITableView()

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    
        style()
        layout()
        
        Service.fetchUsers { users in
            for user in users {
                print(user.name)
            }
        }
    }
    
}

//MARK: - Helpers
extension NewMessageViewController {
    //Style
    private func style() {
        view.backgroundColor = K.Colors.bondi
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        
        //TableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UserCell.self, forCellReuseIdentifier: K.TableViewCellIdentifier.userCell)
        tableView.rowHeight = K.Size.tableViewRowHeight
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = K.Colors.bondi
    }
    
    //Layout
    private func layout() {
        view.addSubview(titleLabel)
        view.addSubview(dividerView)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            dividerView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            dividerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 0.7),
            
            
            tableView.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 5),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        ])
    }
}

//MARK: - UITableViewDelegate - UITableViewDelagate
extension NewMessageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.TableViewCellIdentifier.userCell, for: indexPath) as! UserCell
        
        return cell
    }
    
    
    
    
}

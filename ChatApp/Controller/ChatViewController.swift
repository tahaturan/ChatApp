//
//  ChatViewController.swift
//  ChatApp
//
//  Created by Taha Turan on 12.09.2023.
//

import UIKit

class ChatViewController: UIViewController {
    private var userModel: UserModel

    init(user: UserModel) {
        userModel = user
        super.init(nibName: nil, bundle: nil)    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        print(userModel.name)
        navigationItem.largeTitleDisplayMode = .never
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

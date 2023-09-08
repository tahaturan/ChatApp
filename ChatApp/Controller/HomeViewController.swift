//
//  HomeViewController.swift
//  ChatApp
//
//  Created by Taha Turan on 9.09.2023.
//

import UIKit
import FirebaseAuth


class HomeViewController: UIViewController {
    // MARK: - Properties

    // MARK: - Lyfecycle

    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    //SignOut
    private func signOut() {
        do {
            try Auth.auth().signOut()
        } catch  {
            
        }
    }
    
    
    //Style
    private func style() {
        view.backgroundColor = .red
    }
    //Layout
    private func layout() {
    }
}

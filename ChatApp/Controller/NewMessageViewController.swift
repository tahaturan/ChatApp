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

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    
        style()
        layout()
    }
    
}

//MARK: - Helpers
extension NewMessageViewController {
    //Style
    private func style() {
        view.backgroundColor = K.Colors.bondi
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        dividerView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //Layout
    private func layout() {
        view.addSubview(titleLabel)
        view.addSubview(dividerView)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            dividerView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            dividerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 0.7)
        
        ])
    }
    

}


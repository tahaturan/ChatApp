//
//  RegisterViewController.swift
//  ChatApp
//
//  Created by Taha Turan on 6.09.2023.
//

import UIKit

class RegisterViewController: UIViewController {
    
    //MARK: - Properties
    
    //addCameraButton
    private let addCameraButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        let buttonImage: UIImage = UIImage(systemName: K.Icons.photoICon)!
        button.setImage(buttonImage, for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        return button
    }()
    
    //Email
    private let emailTextField: CustomTextField = CustomTextField(placeholderText: K.StringText.email)
    private lazy var  emailContainerView: AuthenticationInputView = AuthenticationInputView(imageString: K.Icons.mailIcon, textField: emailTextField)
    
    //Name
    private let nameTextField: CustomTextField = CustomTextField(placeholderText: K.StringText.name)
    private lazy var  nameContainerView: AuthenticationInputView = AuthenticationInputView(imageString: K.Icons.personIcon, textField: nameTextField)
    
    //UserName
    private let userNameTextField: CustomTextField = CustomTextField(placeholderText: K.StringText.userName)
    private lazy var userNameContainerView: AuthenticationInputView = AuthenticationInputView(imageString: K.Icons.personIcon, textField: userNameTextField)
   
    //Password
    private let passwordTextField: CustomTextField = CustomTextField(placeholderText: K.StringText.password , isSecureText: true)
    private lazy var passwordContainerView: AuthenticationInputView = AuthenticationInputView(imageString: K.Icons.lockIcon, textField: passwordTextField)
    
    //registerButton
    private let registerButton: CustomButton = CustomButton(title: K.StringText.register , enabled: false)
    
    //StackView
    private var stackView: UIStackView = UIStackView()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
    
}

//MARK: - Helper

extension RegisterViewController {
    //Setup Style
    private func style() {
        //view
        addGradientLayer(to: view)
        self.navigationController?.navigationBar.isHidden = true
        
        //addCameraButton
        addCameraButton.translatesAutoresizingMaskIntoConstraints = false
        
        //stackView
        stackView = UIStackView(arrangedSubviews: [emailContainerView, nameContainerView, userNameContainerView, passwordContainerView, registerButton])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    // Setup Layout
    private func layout() {
        view.addSubview(addCameraButton)
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            //addCameraButton
            addCameraButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            addCameraButton.heightAnchor.constraint(equalToConstant: K.Size.logoHeight),
            addCameraButton.widthAnchor.constraint(equalToConstant: K.Size.logoWidth),
            addCameraButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        
            //stackView & EmailContainerView
            stackView.topAnchor.constraint(equalTo: addCameraButton.bottomAnchor , constant: 64),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            emailContainerView.heightAnchor.constraint(equalToConstant: K.Size.emailContainerViewHeight),
            
        ])
    }
}

//
//  ProfileView.swift
//  ChatApp
//
//  Created by Taha Turan on 15.09.2023.
//

import UIKit
import FirebaseAuth
import Firebase

protocol ProfileViewProtocol {
    func signOutProfile()
}

class ProfileView: UIView {
    //MARK: - Properties
    var delagate: ProfileViewProtocol?
    private var currentUser: UserModel? {
        didSet { configureProfile()}
    }
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        imageView.layer.borderColor = K.Colors.superSilver.cgColor
        imageView.layer.borderWidth = 3
        return imageView
    }()
    private let nameLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.textColor = K.Colors.superSilver
        
        return label
    }()
    private let userNameLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textColor = K.Colors.nileStone
       
        return label
    }()
    private lazy var stackView: UIStackView = UIStackView()
    private lazy var signoutButton: CustomButton = CustomButton(title: "Sign Out", color: K.Colors.darkDenimBlue, action: handleSingoutButton)
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: .zero)
        style()
        layout()
        fetchUser()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - Helpers
extension ProfileView {
    private func style(){
        backgroundColor = K.Colors.bondi
        //ProfileImageView
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.layer.cornerRadius = K.Size.profileImageViewWidthHeight / 2
        //StackView
        stackView = UIStackView(arrangedSubviews: [nameLabel, userNameLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 5
        
        //signoutButton
        signoutButton.translatesAutoresizingMaskIntoConstraints = false
        
        
    }
    
    private func layout(){
        addSubview(profileImageView)
        addSubview(stackView)
        addSubview(signoutButton)
        NSLayoutConstraint.activate([
        //ProfileImageView
            profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            profileImageView.widthAnchor.constraint(equalToConstant: K.Size.profileImageViewWidthHeight),
            profileImageView.heightAnchor.constraint(equalToConstant: K.Size.profileImageViewWidthHeight),
            profileImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            //StackView
            stackView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 12),
        
            
            //signoutButton
            signoutButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 40),
            signoutButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            signoutButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
    }
    
    private func fetchUser(){
        guard let uid = Auth.auth().currentUser?.uid else {return}
        Service.fetchUserProfile(userID: uid) { user, error in
            if error != nil {
                print(error!.localizedDescription)
            }else{
                self.currentUser = user!
                self.configureProfile()
            }
        }
    }
    
    
    private func configureProfile() {
        guard let user = currentUser else { return }
        profileImageView.sd_setImage(with: URL(string: user.profileImage))
        nameLabel.text = user.name
        userNameLabel.text = user.username
    }
    
    
    private func handleSingoutButton() {
        delagate?.signOutProfile()
    }
}

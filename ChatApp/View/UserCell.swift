//
//  UserCell.swift
//  ChatApp
//
//  Created by Taha Turan on 11.09.2023.
//

import UIKit
import SDWebImage

class UserCell: UITableViewCell {
    // MARK: - Properties
    var user:UserModel? {
        didSet {
            configureUserCell()
        }
    }
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .cyan
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let title: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: K.Size.FontSize.standart)
        label.textColor = K.Colors.superSilver
        return label
    }()
    private let subTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: K.Size.FontSize.small)
        label.textColor = K.Colors.nileStone
        return label
    }()
    
    private var stackView = UIStackView()

    // MARK: - LyfeCycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setup()
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Helpers

extension UserCell {
    private func setup() {
        backgroundColor = K.Colors.bondi
        //ProfileImageView
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.layer.cornerRadius = K.Size.newMessageUserProfileHeight / 2
        profileImageView.layer.borderColor = K.Colors.superSilver.cgColor
        profileImageView.clipsToBounds = true
        profileImageView.layer.borderWidth = 1
        
        //StackView
        stackView = UIStackView(arrangedSubviews: [title, subTitle])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func layout() {
        addSubview(profileImageView)
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            //Profile Image
            profileImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            profileImageView.heightAnchor.constraint(equalToConstant: K.Size.newMessageUserProfileHeight),
            profileImageView.widthAnchor.constraint(equalToConstant: K.Size.newMessageUserProfileWidth),
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            
            //StackView
            stackView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
            
        
        ])
    }
    
    private func configureUserCell() {
        guard let user = user else { return }
        
        title.text = user.name
        subTitle.text = user.username
        profileImageView.sd_setImage(with: URL(string: user.profileImage))
    }
}

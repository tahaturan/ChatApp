//
//  LastUserMessageCell.swift
//  ChatApp
//
//  Created by Taha Turan on 14.09.2023.
//

import UIKit
import SDWebImage

class LastUserMessageCell: UITableViewCell {
    // MARK: - Properties
    var lastUser:LastUser? {
        didSet {
            configureLastUserCell()
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
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textColor = K.Colors.darkDenimBlue
        return label
    }()
    private let subTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: K.Size.FontSize.small)
        label.textColor = K.Colors.bondi
        return label
    }()
    private let timestamp: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: K.Size.FontSize.small)
        label.textColor = K.Colors.bondi
        label.text = "17:30"
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

extension LastUserMessageCell {
    private func setup() {
        
        //ProfileImageView
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.layer.cornerRadius = K.Size.emailContainerViewHeight / 2
        profileImageView.layer.borderColor = K.Colors.darkDenimBlue.cgColor
        profileImageView.clipsToBounds = true
        profileImageView.layer.borderWidth = 1
        
        //StackView
        stackView = UIStackView(arrangedSubviews: [title, subTitle])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .leading
        
        //timestamp
        timestamp.translatesAutoresizingMaskIntoConstraints = false
    }

    private func layout() {
        addSubview(profileImageView)
        addSubview(stackView)
        addSubview(timestamp)
        NSLayoutConstraint.activate([
            //Profile Image
            profileImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            profileImageView.heightAnchor.constraint(equalToConstant: K.Size.emailContainerViewHeight),
            profileImageView.widthAnchor.constraint(equalToConstant: K.Size.emailContainerViewHeight),
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            
            //StackView
            stackView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            
            //timestamp
            timestamp.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            timestamp.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
            
        
        ])
    }
    
    private func configureLastUserCell() {
        guard let lastUser = lastUser else { return }
        
        title.text = lastUser.user.name
        subTitle.text = lastUser.message.text
        profileImageView.sd_setImage(with: URL(string: lastUser.user.profileImage))
        timestamp.text = lastUser.message.timestamp.dateValue().dateFormatLastMessage()
        
    }
}

//
//  MessageTableViewCell.swift
//  ChatApp
//
//  Created by Taha Turan on 13.09.2023.
//

import UIKit

class MessageTableViewCell: UITableViewCell {
    //MARK: - Properties
    private let profileImageView:UIImageView = {
       let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .yellow
        return imageView
    }()
    private let messageContainerView: UIView = {
       let containerView = UIView()
        containerView.backgroundColor = K.Colors.bondi
        return containerView
    }()
     var messageTextView: UITextView = {
       let textView = UITextView()
        textView.backgroundColor = .clear
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.font = UIFont.preferredFont(forTextStyle: .title3)
        textView.textColor = K.Colors.superSilver
        textView.sizeToFit()

        return textView
    }()
    //MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - Helpers
extension MessageTableViewCell {
    //SetupUI
    private func setupUI() {
        //profileImageView
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.layer.cornerRadius = K.Size.messageCellProfileImageWidthHeight / 2
        //messageContainerView
        messageContainerView.translatesAutoresizingMaskIntoConstraints = false
        messageContainerView.layer.cornerRadius = K.Size.messageCellProfileImageWidthHeight / 3
        messageContainerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        
        //messageTextView
        messageTextView.translatesAutoresizingMaskIntoConstraints = false
    }
    //Layout
    private func layout() {
        addSubview(profileImageView)
        addSubview(messageContainerView)
        addSubview(messageTextView)
        
        NSLayoutConstraint.activate([
            //ProfileImageView
            profileImageView.widthAnchor.constraint(equalToConstant: K.Size.messageCellProfileImageWidthHeight),
            profileImageView.heightAnchor.constraint(equalToConstant: K.Size.messageCellProfileImageWidthHeight),
            bottomAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: -8),
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            //MessageContainerView
            messageContainerView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            messageContainerView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 8),
            messageContainerView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -8),
            messageContainerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            //MessageTextView
            messageTextView.topAnchor.constraint(equalTo: messageContainerView.topAnchor),
            messageTextView.leadingAnchor.constraint(equalTo: messageContainerView.leadingAnchor),
            messageTextView.trailingAnchor.constraint(equalTo: messageContainerView.trailingAnchor),
            messageTextView.bottomAnchor.constraint(equalTo: messageContainerView.bottomAnchor)
            
        
        ])
        
    }
}

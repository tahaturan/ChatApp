//
//  ChatMessageTextFieldInputView.swift
//  ChatApp
//
//  Created by Taha Turan on 13.09.2023.
//

import UIKit

class ChatMessageTextFieldInputView: UIView {
    init(textField: UITextField) {
        super.init(frame: .zero)

        backgroundColor = K.Colors.darkDenimBlue
        
        tintColor = K.Colors.superSilver

        //ImageView
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: K.Icons.writeIcon)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)

        //TextField
        textField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textField)
        
        //Button
        let sendButton = UIButton(type: .system)
        let sendImage = UIImage(systemName: "paperplane.circle")
        sendButton.setImage(sendImage, for: .normal)
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(sendButton)
       

        NSLayoutConstraint.activate([
            //ImageView
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            imageView.widthAnchor.constraint(equalToConstant: K.Size.messageIconWithHeight),
            imageView.heightAnchor.constraint(equalToConstant: K.Size.messageIconWithHeight),
            //TextField
            textField.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            textField.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8),
            textField.widthAnchor.constraint(equalToConstant: K.Size.messageTextFieldWidth),
            textField.heightAnchor.constraint(equalToConstant: K.Size.messageTextFieldHeight),
            
            
            //SendButton
            sendButton.centerYAnchor.constraint(equalTo: textField.centerYAnchor),
            sendButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
        
            

        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

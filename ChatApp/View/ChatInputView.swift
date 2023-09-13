//
//  ChatMessageTextFieldInputView.swift
//  ChatApp
//
//  Created by Taha Turan on 13.09.2023.
//

import UIKit
protocol ChatInputViewProtocol {
    func sendMessage(_ ChatMessageTextFieldInputView: ChatInputView, message: String )
}

class ChatInputView: UIView {
    //MARK: - Properties
    var delagate: ChatInputViewProtocol?
    private let imageView = UIImageView()
    private let sendButton = UIButton(type: .system)
    
    private let textField: UITextField = {
       let textField = UITextField()
        textField.attributedPlaceholder = NSMutableAttributedString(string: K.StringText.message, attributes: [
            .foregroundColor: K.Colors.superSilver,
            
        ])
        
        textField.borderStyle = .none
        textField.textColor = K.Colors.superSilver
        textField.backgroundColor = K.Colors.bondi
        textField.layer.cornerRadius = K.Size.messageTextFieldHeight / 3
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.rightView = paddingView
        textField.rightViewMode = .always
        return textField
    }()
    init() {
        super.init(frame: .zero)
        backgroundColor = K.Colors.darkDenimBlue
        tintColor = K.Colors.superSilver

        //ImageView
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: K.Icons.writeIcon)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)

        //TextField
        textField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textField)
        
        //Button
        let sendImage = UIImage(systemName: "paperplane.circle")
        sendButton.setImage(sendImage, for: .normal)
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.addTarget(self, action: #selector(handleSendButton), for: .touchUpInside)
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

//MARK: - Selector
extension ChatInputView {
    @objc private func handleSendButton(_ sender: UIButton) {
        if textField.text != "" {
            self.delagate?.sendMessage(self, message: textField.text!)
            textField.text = ""
        }
    }
}

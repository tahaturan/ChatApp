//
//  MessageTextField.swift
//  ChatApp
//
//  Created by Taha Turan on 13.09.2023.
//

import UIKit
class MessageTextField: UITextField {
    
    init() {
        super.init(frame: .zero)
        
        attributedPlaceholder = NSMutableAttributedString(string: K.StringText.message, attributes: [
            .foregroundColor: K.Colors.superSilver,
            
        ])
        
        borderStyle = .none
        textColor = K.Colors.superSilver
        backgroundColor = K.Colors.bondi
        layer.cornerRadius = K.Size.messageTextFieldHeight / 3
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: frame.height))
               leftView = paddingView
               leftViewMode = .always
        rightView = paddingView
        rightViewMode = .always
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

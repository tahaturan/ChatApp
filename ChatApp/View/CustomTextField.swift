//
//  CustomTextField.swift
//  ChatApp
//
//  Created by Taha Turan on 3.09.2023.
//

import UIKit

class CustomTextField: UITextField {
    
    init(placeholderText: String , isSecureText: Bool = false) {
        super.init(frame: .zero)
        
        attributedPlaceholder = NSMutableAttributedString(string: placeholderText, attributes: [
            .foregroundColor : K.Colors.bondi,
            
        ])
        borderStyle = .none
        textColor = .black
        isSecureTextEntry = isSecureText
        
        if isSecureText {
            let eyeButton: UIButton = {
                let eyebutton = UIButton(type: .system)
                let image: UIImage = UIImage(systemName: K.Icons.eyeIcon)!
                
        
                eyebutton.setImage(image, for: .normal)
                eyebutton.addTarget(self, action: #selector(eyeButtonTapped), for: .touchUpInside)

                return eyebutton
            }()
            rightView = eyeButton
            rightViewMode = .always
            rightView?.tintColor = K.Colors.nileStone
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func eyeButtonTapped(){
        isSecureTextEntry = !isSecureTextEntry
    }
}

//
//  CustomTextField.swift
//  ChatApp
//
//  Created by Taha Turan on 3.09.2023.
//

import UIKit

class CustomTextField: UITextField {
    
    init(placeholderText: String) {
        super.init(frame: .zero)
        
        attributedPlaceholder = NSMutableAttributedString(string: placeholderText, attributes: [
            .foregroundColor : UIColor.systemGray,
            
        ])
        
        borderStyle = .none
        textColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

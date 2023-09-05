//
//  CustomButton.swift
//  ChatApp
//
//  Created by Taha Turan on 6.09.2023.
//

import UIKit

class CustomButton: UIButton {
    
    init(title: String, enabled: Bool = true , color: UIColor = K.Colors.bondi, titleColor: UIColor = .white) {
        super.init(frame: .zero)
        
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        backgroundColor = color
        layer.cornerRadius = K.Size.emailContainerViewHeight / 3
        isEnabled = enabled
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

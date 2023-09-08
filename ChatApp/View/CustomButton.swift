//
//  CustomButton.swift
//  ChatApp
//
//  Created by Taha Turan on 6.09.2023.
//

import UIKit

class CustomButton: UIButton {
    
    private var action: (() -> Void)?
    
    init(title: String, enabled: Bool = true , color: UIColor = K.Colors.bondi, titleColor: UIColor = .white , font: UIFont.TextStyle = .title3, action: (() -> Void)? = nil) {
        super.init(frame: .zero)
        
        self.action = action
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        backgroundColor = color
        layer.cornerRadius = K.Size.emailContainerViewHeight / 3
        isEnabled = enabled
        titleLabel?.font = UIFont.preferredFont(forTextStyle: font)
        addTarget(self, action: #selector(handleButtonAction), for: .touchUpInside)
    }
    
    @objc private func handleButtonAction() {
        action?()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  CustomTextField.swift
//  ChatApp
//
//  Created by Taha Turan on 3.09.2023.
//

import UIKit

class CustomTextField: UITextField {
    // Bu özel değişken, görünürlük düğmesini içermek için kullanılır
    // This private variable is used to hold the visibility toggle button.
    private let visibilityToggleButton: UIButton = UIButton(type: .system)
    
    init(placeholderText: String, isSecureText: Bool = false) {
        super.init(frame: .zero)
        
        // Metin giriş alanının yer tutucu metnini ayarlar ve rengini belirler
        // Sets the placeholder text and its color for the text input field.
        attributedPlaceholder = NSMutableAttributedString(string: placeholderText, attributes: [
            .foregroundColor: K.Colors.bondi, // Metin rengi
            // Text color
        ])
        
        // Metin giriş alanının sınırlarını kaldırır ve metin rengini belirler
        // Removes the borders of the text input field and sets the text color.
        borderStyle = .none
        textColor = .black // Metin rengi
        // Text color
        
        // Eğer şifre girişi gerekiyorsa, görünürlük düğmesini yapılandırır
        // If secure text input is required, configures the visibility toggle button.
        isSecureTextEntry = isSecureText
        if isSecureText {
            setupVisibilityToggleButton() // Görünürlük düğmesi oluşturulur ve yapılandırılır
            // Creates and configures the visibility toggle button
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Görünürlük düğmesini oluşturur ve yapılandırır
    // Creates and configures the visibility toggle button
    private func setupVisibilityToggleButton() {
        // Görünürlük düğmesinin görünümünü ve davranışını belirler
        // Sets the appearance and behavior of the visibility toggle button
        let imageName = isSecureTextEntry ? K.Icons.eyeSlash : K.Icons.eyeIcon // Göz simgesi veya çizgi simgesi
        // Either the eye icon or the crossed eye icon
        let image = UIImage(systemName: imageName)! // Simgenin görüntüsü
        // The image of the icon
        
        visibilityToggleButton.setImage(image, for: .normal)
        visibilityToggleButton.translatesAutoresizingMaskIntoConstraints = false
        visibilityToggleButton.addTarget(self, action: #selector(toggleVisibility), for: .touchUpInside)
        
        // Metin giriş alanının sağ tarafına görünürlük düğmesini ekler
        // Adds the visibility toggle button to the right side of the text input field
        rightView = visibilityToggleButton
        rightViewMode = .always
        rightView?.tintColor = K.Colors.nileStone // Düğmenin rengi
        // The color of the button
    }
    
    // Görünürlük düğmesine tıklanıldığında metni görünür veya gizli hale getirir
    // Toggles the visibility of the text when the visibility toggle button is clicked
    @objc private func toggleVisibility() {
        isSecureTextEntry.toggle() // Şifre girişinin görünürlüğünü değiştirir
        // Toggles the visibility of the password
        
        // Görünürlük düğmesinin görünümünü günceller
        // Updates the appearance of the visibility toggle button
        let imageName = isSecureTextEntry ? K.Icons.eyeSlash : K.Icons.eyeIcon
        // Either the crossed eye icon or the eye icon
        let image = UIImage(systemName: imageName)! // Güncel simge
        // The updated icon
        
        visibilityToggleButton.setImage(image, for: .normal)
    }
}


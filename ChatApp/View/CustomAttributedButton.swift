//
//  CustomAttributedButton.swift
//  ChatApp
//
//  Created by Taha Turan on 6.09.2023.
//

import UIKit

class CustomAttributedButton: UIButton {
    // Bu kapatıcı, düğme tıklama olayı tetiklendiğinde çağrılacak işlemi temsil eder.
    // This closure represents the action to be called when the button click event is triggered.
    private var action: (() -> Void)?

    // Özel bir düğme oluştururken başlık, metin rengi, yazı tipi boyutu ve işlemi belirtmek için kullanılan özel bir initsializör.
    // Custom initializer used to create a custom button, specifying the title, text color, font size, and action.
    init(title: String, textColor: UIColor = K.Colors.superSilver, fontSize: CGFloat = 14, action: (() -> Void)?) {
        super.init(frame: .zero)
        
        // Düğme özelliklerini yapılandırmak için özel bir yardımcı işlev çağırılır.
        // Call a helper function to configure the button properties.
        configureButton(withTitle: title, textColor: textColor, fontSize: fontSize)
        
        // Belirtilen işlemi düğme tıklama olayına bağlama.
        // Bind the specified action to the button's touchUpInside event.
        self.action = action
        addTarget(self, action: #selector(handleButtonAction), for: .touchUpInside)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // Düğmenin metin rengi ve yazı tipi boyutu gibi özelliklerini ayarlamak için kullanılan özel bir yardımcı işlev.
    // Helper function used to set button properties such as text color and font size.
    private func configureButton(withTitle title: String, textColor: UIColor, fontSize: CGFloat) {
        let attributedTitle = NSMutableAttributedString(string: title, attributes: [
            .foregroundColor: textColor, // Metin rengini ayarlar.
            .font: UIFont.boldSystemFont(ofSize: fontSize) // Yazı tipi boyutunu ayarlar.
        ])
        setAttributedTitle(attributedTitle, for: .normal)
    }

    // Düğme tıklama olayını işlemek ve belirtilen işlemi çağırmak için kullanılan özel bir yardımcı işlev.
    // Helper function to handle the button click event and invoke the specified action.
    @objc private func handleButtonAction() {
        action?()
    }
}

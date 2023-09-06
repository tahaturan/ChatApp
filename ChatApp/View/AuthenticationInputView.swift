//
//  AuthenticationInputView.swift
//  ChatApp
//
//  Created by Taha Turan on 3.09.2023.
//

import UIKit
class AuthenticationInputView: UIView {
    init(imageString: String, textField: UITextField) {
        super.init(frame: .zero)
        
        // Set the background color of the view.
        // Görünümün arka plan rengini ayarlar.
        backgroundColor = K.Colors.superSilver
        // Round the corners of the view.
        // Görünümün köşelerini yuvarlatır.
        layer.cornerRadius = K.Size.emailContainerViewHeight / 2
        
        // Create a UIImageView and set its properties.
        // Bir UIImageView oluşturur ve özelliklerini ayarlar.
        let imageView = UIImageView()
        
        // Configure the content mode of the created UIImageView to scale the image to fit within the view's bounds while maintaining the aspect ratio.
        // Oluşturulan UIImageView'in içerik modunu, görünüm sınırları içinde görüntüyü sığdıracak şekilde ayarlar ve oranı korur.
        imageView.contentMode = .scaleAspectFill
        
        // Clip the image to fit within the bounds of the view.
        // Resmi, görünümün sınırları içine sığacak şekilde kırpar.
        imageView.clipsToBounds = true
        
        // Set the image of the UIImageView based on the provided symbol name (e.g., "imageString").
        // UIImageView'in resmini sağlanan sembol adına (örneğin, "imageString") göre ayarlar.
        imageView.image = UIImage(named: imageString)
        
        
        // Disable automatic resizing to use custom dimensions.
        // Özel boyutları kullanmak için otomatik boyutlandırmayı devre dışı bırakır.
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the UIImageView to the AuthenticationInputView.
        // UIImageView'i AuthenticationInputView'a ekler.
        addSubview(imageView)
        
        // Configure the properties of the UITextField and add it to the view.
        // UITextField özelliklerini ayarlar ve görünüme ekler.
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the UITextField to the AuthenticationInputView.
        // UITextField'i AuthenticationInputView'a ekler.
        addSubview(textField)
        
        // Use constraints to define the positions and sizes of imageView and textField.
        // imageView ve textField'ın konumlarını ve boyutlarını tanımlamak için kısıtlamaları kullanır.
        NSLayoutConstraint.activate([
            // Constraints for imageView
            // imageView için kısıtlamalar
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            // Set the leading edge of the imageView to be 8 points away from the leading edge of the AuthenticationInputView.
            // imageView'in sol kenarını, AuthenticationInputView'ın sol kenarından 8 birim uzaklıkta ayarlar.

            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            // Vertically center the imageView within the AuthenticationInputView.
            // imageView'i AuthenticationInputView içinde dikey olarak ortalar.

            imageView.widthAnchor.constraint(equalToConstant: 24),
            // Set the width of the imageView to a constant value of 24 points.
            // imageView'in genişliğini sabit bir değer olan 24 birime ayarlar.

            imageView.heightAnchor.constraint(equalToConstant: 24),
            // Set the height of the imageView to a constant value of 24 points.
            // imageView'in yüksekliğini sabit bir değer olan 24 birime ayarlar.

            
            // Constraints for textField
            // textField için kısıtlamalar
            textField.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            // Vertically center the textField with respect to the imageView.
            // textField'i imageView'a göre dikey olarak ortalar.

            textField.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8),
            // Set the leading edge of the textField to be adjacent to the trailing edge of the imageView with a horizontal spacing of 8 points.
            // textField'in sol kenarını, imageView'ın sağ kenarına bitişik olacak şekilde ayarlar ve aralarında 8 birimlik yatay boşluk bırakır.

            trailingAnchor.constraint(equalTo: textField.trailingAnchor, constant: 8)
            // Set the trailing edge of the AuthenticationInputView to be adjacent to the trailing edge of the textField with a horizontal spacing of 8 points.
            // AuthenticationInputView'ın sağ kenarını, textField'ın sağ kenarına bitişik olacak şekilde ayarlar ve aralarında 8 birimlik yatay boşluk bırakır.

        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


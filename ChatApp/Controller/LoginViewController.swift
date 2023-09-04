//
//  ViewController.swift
//  ChatApp
//
//  Created by Taha Turan on 2.09.2023.
//

import UIKit

class LoginViewController: UIViewController {
    //MARK: - Properties
    
    // Türkçe: Logo görüntüsünü tutmak için özel bir UIImageView oluşturur.
    // English: Creates a custom UIImageView to hold the logo image.
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        // Türkçe: Bu satır, görüntüyü çerçeve boyutlarına tam olarak sığdırır, ancak orantısız olarak çerçeve boyutlarına genişletir veya sıkıştırır.
        // English: This line scales the image to completely cover the frame, stretching or compressing it if necessary, resulting in a possibly distorted or non-proportional image fit to the frame.
        imageView.contentMode = .scaleToFill

        // Türkçe: Resim doldurma ve kırpma özelliklerini ayarlar.
        // English: Sets the image content mode to scale to fill and enables clipping.
        imageView.clipsToBounds = true
        
        // Türkçe: logoImageView'a bir mesaj sembolü ekler.
        // English: Adds a message symbol to logoImageView.
        imageView.image = UIImage(systemName: K.Icons.logoImage)
        
        // Türkçe: Resmin rengini beyaz olarak ayarlar.
        // English: Sets the color of the image to white.
        imageView.tintColor = .white
        
        return imageView
    }()
    
    //Email
    private let emailTextField: CustomTextField = CustomTextField(placeholderText: "email")
    private lazy var  emailContainerView: AuthenticationInputView = AuthenticationInputView(imageString: K.Icons.mailIcon, textField: emailTextField)
   
    //Password
    private let passwordTextField: CustomTextField = CustomTextField(placeholderText: "password" , isSecureText: true)
    private lazy var passwordContainerView: AuthenticationInputView = AuthenticationInputView(imageString: K.Icons.lockIcon, textField: passwordTextField)

    private var stackView: UIStackView = UIStackView()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = K.Colors.darkDenimBlue
        button.layer.cornerRadius = K.Size.emailContainerViewHeight / 3
        button.isEnabled = false
        return button
    }()
    
    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Türkçe: Ana görünüme bir gradyan katmanı ekler.
        // English: Adds a gradient layer to the main view.
        addGradientLayer(to: view)
        
        // Türkçe: Özel stilleri uygular.
        // English: Applies custom styles.
        style()
        
        // Türkçe: Arayüz öğelerini düzenler.
        // English: Arranges interface elements.
        layout()
    }
}

//MARK: - Helper
extension LoginViewController {
    private func style() {
        self.navigationController?.navigationBar.isHidden = true
        // Türkçe: logoImageView'un otomatik boyutlandırmayı devre dışı bırakır.
        // English: Disables automatic resizing for logoImageView.
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        emailContainerView.translatesAutoresizingMaskIntoConstraints = false
        //StackView
        stackView = UIStackView(arrangedSubviews: [emailContainerView,passwordContainerView,loginButton])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        // Türkçe: LogoImageView'u ana görünüme ekler.
        // English: Adds logoImageView to the main view.
        view.addSubview(logoImageView)
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            // Türkçe: LogoImageView'un üst kenarını güvenli alanın üst kenarına 16 birim uzaklıkta konumlandırır.
            // English: Positions logoImageView 16 units below the top edge of the safe area.
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            
            // Türkçe: LogoImageView'un yüksekliğini 150 birime sabitler.
            // English: Sets the height of logoImageView to 150 units.
            logoImageView.heightAnchor.constraint(equalToConstant: K.Size.logoHeight),
            
            // Türkçe: LogoImageView'un genişliğini 150 birime sabitler.
            // English: Sets the width of logoImageView to 150 units.
            logoImageView.widthAnchor.constraint(equalToConstant: K.Size.logoWidth),

            // Türkçe: LogoImageView'u ana görünümün ortasına hizalar.
            // English: Centers logoImageView horizontally in the main view.
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            //stackView & EmailContainerView
            stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor , constant: 64),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            emailContainerView.heightAnchor.constraint(equalToConstant: K.Size.emailContainerViewHeight)
           
        ])
    }
}


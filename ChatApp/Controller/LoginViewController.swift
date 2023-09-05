//
//  ViewController.swift
//  ChatApp
//
//  Created by Taha Turan on 2.09.2023.
//

import UIKit

class LoginViewController: UIViewController {
    //MARK: - Properties
    private var viewModel = LoginViewModel()
    
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
    private let emailTextField: CustomTextField = CustomTextField(placeholderText: K.StringText.email)
    private lazy var  emailContainerView: AuthenticationInputView = AuthenticationInputView(imageString: K.Icons.mailIcon, textField: emailTextField)
   
    //Password
    private let passwordTextField: CustomTextField = CustomTextField(placeholderText: K.StringText.password , isSecureText: true)
    private lazy var passwordContainerView: AuthenticationInputView = AuthenticationInputView(imageString: K.Icons.lockIcon, textField: passwordTextField)

    private var stackView: UIStackView = UIStackView()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(K.StringText.logIn, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = K.Colors.bondi
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

//MARK: - Selector
extension LoginViewController {
    // Kullanıcı e-posta veya şifre giriş alanındaki metni değiştirdiğinde, bu işlev tetiklenir ve değişikliği ViewModel'a ileterek günceller.
    // When the user changes the text in either the email or password input field, this function is triggered, updating the ViewModel with the change.
    @objc func handleTextFieldChange(_ sender: UITextField){
        if sender == emailTextField {
            // Türkçe: E-posta giriş alanındaki metni ViewModel'a ileterek günceller.
            // English: Updates the ViewModel with the text in the email input field.
            viewModel.emailTextFieldText = sender.text
        } else {
            // Türkçe: Şifre giriş alanındaki metni ViewModel'a ileterek günceller.
            // English: Updates the ViewModel with the text in the password input field.
            viewModel.passwordTextFieldText = sender.text
        }
        
        // Türkçe: Giriş düğmesinin durumunu günceller.
        // English: Updates the status of the login button.
        loginButtonStatus()
    }

}

//MARK: - Helper
extension LoginViewController {
    private func loginButtonStatus() {
        // Türkçe: ViewModel'deki durumu kontrol eder ve giriş düğmesini etkinleştirip arka plan rengini uygun şekilde günceller.
        // English: Checks the state in the ViewModel and enables or disables the login button while updating its background color accordingly.
        if viewModel.status {
            loginButton.isEnabled = true
            loginButton.backgroundColor = K.Colors.darkDenimBlue
        } else {
            // Türkçe: Eğer ViewModel'deki durum "false" ise, giriş düğmesini devre dışı bırakır ve arka plan rengini "K.Colors.bondi" olarak ayarlar.
            // English: If the state in the ViewModel is "false," it disables the login button and sets its background color to "K.Colors.bondi."
            loginButton.isEnabled = false
            loginButton.backgroundColor = K.Colors.bondi
        }
    }
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
        //Email & PasswordTextfield
        // Kullanıcı e-posta giriş alanındaki metni değiştirdiğinde, "handleTextFieldChange" işlevini tetiklemek için "emailTextField" öğesine bir hedef (target) ekleriz.
        // When the user changes the text in the email input field, we add a target to the "emailTextField" element to trigger the "handleTextFieldChange" function.
        emailTextField.addTarget(self, action: #selector(handleTextFieldChange), for: .editingChanged)

        // Kullanıcı şifre giriş alanındaki metni değiştirdiğinde, "handleTextFieldChange" işlevini tetiklemek için "passwordTextField" öğesine bir hedef (target) ekleriz.
        // When the user changes the text in the password input field, we add a target to the "passwordTextField" element to trigger the "handleTextFieldChange" function.
        passwordTextField.addTarget(self, action: #selector(handleTextFieldChange), for: .editingChanged)

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


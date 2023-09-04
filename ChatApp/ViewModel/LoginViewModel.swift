//
//  LoginViewModel.swift
//  ChatApp
//
//  Created by Taha Turan on 4.09.2023.
//

import Foundation

struct LoginViewModel {
    var emailTextFieldText: String?
    var passwordTextFieldText: String?
    
    var status: Bool {
        return emailTextFieldText?.isEmpty == false && passwordTextFieldText?.isEmpty == false
    }
}

//
//  RegisterViewModel.swift
//  ChatApp
//
//  Created by Taha Turan on 6.09.2023.
//

import Foundation

struct RegisterViewModel {
    var email: String?
    var name: String?
    var userName: String?
    var password: String?
    
    var isInputValid: Bool {
        return email?.isEmpty == false && name?.isEmpty == false && userName?.isEmpty == false && password?.isEmpty == false
    }
}

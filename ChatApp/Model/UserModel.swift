//
//  UserModel.swift
//  ChatApp
//
//  Created by Taha Turan on 11.09.2023.
//

import Foundation

struct UserModel {
    let uid: String
    let name: String
    let username: String
    let email: String
    let profileImage: String
    
    init(data: [String : Any]) {
        self.uid = data["uid"] as? String ?? ""
        self.name = data["name"] as? String ?? ""
        self.username = data["username"] as? String ?? ""
        self.email = data["email"] as? String ?? ""
        self.profileImage = data["profileImageUrl"] as? String ?? ""
    }
}


struct LastUser {
    let user: UserModel
    let message: MessageModel
}

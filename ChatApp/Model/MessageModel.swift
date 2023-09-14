//
//  MessageModel.swift
//  ChatApp
//
//  Created by Taha Turan on 14.09.2023.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

struct MessageModel {
    let text: String
    let toId: String
    let fromId: String
    let timestamp: Timestamp!
    var user: UserModel?
    let currentUser: Bool
    
    init(data: [String : Any]) {
        self.text = data["text"] as? String ?? ""
        self.toId = data["toId"] as? String ?? ""
        self.fromId = data["fromId"] as? String ?? ""
        self.timestamp = data["timestamp"] as? Timestamp ?? Timestamp(date: Date())
        self.currentUser = fromId == Auth.auth().currentUser?.uid
    }
}

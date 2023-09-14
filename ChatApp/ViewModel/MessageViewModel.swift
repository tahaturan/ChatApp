//
//  MessageViewModel.swift
//  ChatApp
//
//  Created by Taha Turan on 14.09.2023.
//

import Foundation
import UIKit

struct MessageViewModel {
    private let message: MessageModel

    init(message: MessageModel) {
        self.message = message
    }

    var backgroudColor: UIColor {
        return message.currentUser ? K.Colors.darkDenimBlue : K.Colors.bondi
    }

    var currentUserIsActive: Bool {
        return message.currentUser
    }
    
    var profileImageViewURL: URL? {
        if let user = self.message.user {
            return URL(string: user.profileImage)!
        }else{
            return nil
        }
    }
}

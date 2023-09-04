//
//  AppConstants.swift
//  ChatApp
//
//  Created by Taha Turan on 3.09.2023.
//

import UIKit


struct K {
    
    struct Size {
        static let logoWidth: CGFloat = 150
        static let logoHeight: CGFloat = 150
        static let emailContainerViewHeight: CGFloat = 50

    }
    
    struct Icons {
        static let logoImage: String = "ellipsis.message"
        static let mailIcon: String = "envelope"
        static let lockIcon: String = "lock"
        static let eyeIcon: String = "eye"
    }
    
    struct Colors {
        static let darkDenimBlue: UIColor = UIColor(red: 5/255, green: 59/255, blue: 80/255, alpha: 1)
        static let bondi: UIColor = UIColor(red: 23/255, green: 107/255, blue: 135/255, alpha: 1)
        static let nileStone: UIColor = UIColor(red: 100/255, green: 204/255, blue: 197/255, alpha: 1)
        static let superSilver: UIColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
        static let colorgradiendList: [UIColor] = [darkDenimBlue, bondi, nileStone, superSilver]
    }
    
}

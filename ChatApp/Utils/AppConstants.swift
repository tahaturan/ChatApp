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
        static let logoImage: String = "logoIcon"
        static let mailIcon: String = "email"
        static let lockIcon: String = "padlock"
        static let eyeIcon: String = "eye"
        static let eyeSlash: String = "eye.slash"
        static let cameraICon: String = "camera"
        static let personIcon: String = "user"
        static let memberShip: String = "membership"
    }

    struct Colors {
        static let darkDenimBlue: UIColor = UIColor(red: 5 / 255, green: 59 / 255, blue: 80 / 255, alpha: 1)
        static let bondi: UIColor = UIColor(red: 23 / 255, green: 107 / 255, blue: 135 / 255, alpha: 1)
        static let nileStone: UIColor = UIColor(red: 100 / 255, green: 204 / 255, blue: 197 / 255, alpha: 1)
        static let superSilver: UIColor = UIColor(red: 238 / 255, green: 238 / 255, blue: 238 / 255, alpha: 1)
        static let colorgradiendList: [UIColor] = [darkDenimBlue, bondi, nileStone, superSilver]
        static let colorGradiendLocations: [NSNumber] = [0.3, 0.7, 0.9, 1]
    }

    struct StringText {
        static let email = NSLocalizedString("Email", comment: "")
        static let password = NSLocalizedString("Password", comment: "")
        static let logIn = NSLocalizedString("Log In", comment: "")
        static let name = NSLocalizedString("Name", comment: "")
        static let userName = NSLocalizedString("User Name", comment: "")
        static let register = NSLocalizedString("Register", comment: "")
        static let loginToRegisterView = NSLocalizedString("Click To Become a Member", comment: "")
        static let loginPage = NSLocalizedString("If you are a member, Login Page", comment: "")
        static let placeWait = NSLocalizedString("Place Wait", comment: "")
    }

    struct AppErrorLocalizedDescription {
        static let profileImageCreationError = NSLocalizedString("ProfileImageCreationError", comment: "")
        static let imageUploadError = NSLocalizedString("ImageUploadError", comment: "")
        static let downloadUrlError = NSLocalizedString("DownloadUrlError", comment: "")
        static let userCreationError = NSLocalizedString("UserCreationError", comment: "")
        static let firestoreError = NSLocalizedString("FirestoreError", comment: "")
        static let invalidEmail = NSLocalizedString("Invalid email format.", comment: "")
        static let wrongPassword = NSLocalizedString("Incorrect password.", comment: "")
        static let userNotFound = NSLocalizedString("User not found.", comment: "")
        static let networkError = NSLocalizedString("Network error occurred. Please check your internet connection.", comment: "")
        static let unknownErrorMessage = NSLocalizedString("An unknown error occurred.", comment: "")
    }

    struct FireBaseConstants {
        struct FireStoreCollections {
            static let users: String = "users"
            struct UserDataConstans {
                static let email: String = "email"
                static let name: String = "name"
                static let userName: String = "username"
                static let profileImageUrl: String = "profileImageUrl"
                static let uid: String = "uid"
            }
        }

        struct FirebaseStorageConstans {
            static var profileImagePath: String = "media/profile_image"
        }
    }
}

//
//  AuthenticationService.swift
//  ChatApp
//
//  Created by Taha Turan on 7.09.2023.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore

struct UserModel {
    let emailText: String
    let nameText: String
    let userNameText: String
    let passwordText: String
}

struct AuthenticationService {
    static func register(withUser user: UserModel ,image: UIImage, completion: @escaping(Error?)->Void) {
        let photoName = UUID().uuidString
        guard let profileImageData = image.jpegData(compressionQuality: 0.5) else { return }
        let referance = Storage.storage().reference(withPath: "media/profile_image/\(photoName).png")
        referance.putData(profileImageData) { storageMetadata , error in
            if let error = error {
                completion(error)
                return
            }
            
            referance.downloadURL { url, error in
                if let error = error {
                    completion(error)
                    return
                }
                
                guard let profileImageUrl = url?.absoluteString else {return}
                
                Auth.auth().createUser(withEmail: user.emailText, password: user.passwordText) { result, error in
                    if let error = error {
                        completion(error)
                        return
                    }
                    guard let userUid = result?.user.uid else {return}
                    let data: [String:Any] = [
                        "email": user.emailText,
                        "name": user.nameText,
                        "username": user.userNameText,
                        "profileImageUrl": profileImageUrl,
                        "uid": userUid
                    ]
                    Firestore.firestore().collection("users").document(userUid).setData(data , completion: completion)
                    
                }
            }
        }
    }
}

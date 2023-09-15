//
//  ProfileView.swift
//  ChatApp
//
//  Created by Taha Turan on 15.09.2023.
//

import UIKit
import FirebaseAuth
import Firebase

class ProfileView: UIView {
    //MARK: - Properties
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: .zero)
        style()
        layout()
        fetchUser()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - Helpers
extension ProfileView {
    private func style(){
        backgroundColor = K.Colors.bondi
        
    }
    
    private func layout(){
        
    }
    
    private func fetchUser(){
        guard let uid = Auth.auth().currentUser?.uid else {return}
        Service.fetchUserProfile(userID: uid) { user, error in
            if error != nil {
                print(error!.localizedDescription)
            }else{
                print(user!.name)
            }
        }
    }
}

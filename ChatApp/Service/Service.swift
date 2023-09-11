//
//  Service.swift
//  ChatApp
//
//  Created by Taha Turan on 11.09.2023.
//

import Foundation
import FirebaseFirestore

struct Service {
    static func fetchUsers(completion: @escaping([UserModel]) -> Void){
        
        var users:[UserModel] = []
        
        Firestore.firestore().collection(K.FireBaseConstants.FireStoreCollections.users).getDocuments { snapshot, error in
            if error != nil {
                print("Error: \(error!.localizedDescription)")
                return
            }
            users = snapshot?.documents.map({UserModel(data: $0.data())}) ?? []
            
            completion(users)
            
        }
    }
}

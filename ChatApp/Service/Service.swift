//
//  Service.swift
//  ChatApp
//
//  Created by Taha Turan on 11.09.2023.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

struct Service {
    // Kullanıcıları Firestore'dan çekmek için bu işlevi kullanır.
    // This function is used to fetch users from Firestore.
    // Parameters:
    // - completion: Kullanıcıları çekme işlemi tamamlandığında çağrılacak olan tamamlama işlevidir.
    // - completion: A closure to be called when the user fetching process is completed.
    static func fetchUsers(completion: @escaping ([UserModel]?, AppError?) -> Void) {
        var users:[UserModel] = []
        
        Firestore.firestore().collection(K.FireBaseConstants.FireStoreCollections.users).getDocuments { snapshot, error in
            // Hata durumunu kontrol eder.
            // Checks for error condition.
            // Hata koşulunu kontrol eder.
            if error != nil {
                // Hata işleme merkezi: Firestore hata durumu.
                // Error handling center: Firestore error condition.
                completion(nil, .firestoreError)
                return
            }

            // Firestore'dan gelen belgeleri UserModel nesnelerine dönüştürür.
            // Converts documents from Firestore into UserModel objects.
            users = snapshot?.documents.compactMap { UserModel(data: $0.data()) } ?? []

            // Kullanıcıları başarıyla aldık ve tamamlama işlemini çağırıyoruz.
            // We have successfully fetched users and call the completion handler.
            completion(users, nil)
        }
    }

    static func fetchUserProfile(userID: String, completion: @escaping (UserModel?, AppError?) -> Void) {
        // Firestore'da belirli bir kullanıcının profili alınır.
        // This function retrieves the profile of a specific user in Firestore.
        Firestore.firestore().collection(K.FireBaseConstants.FireStoreCollections.users).document(userID).getDocument { snapshot, error in
            // Hata durumunu kontrol eder.
            // Checks for error condition.
            if error != nil {
                // Firestore'dan veri çekme sırasında bir hata oluştu.
                // An error occurred while fetching data from Firestore.
                // Firestore'dan veri çekme sırasında bir hata oluştu.

                completion(nil, .firestoreError)
                return
            }
            if let userData = snapshot?.data() {
                // Firestore'dan gelen veri, UserModel nesnesine dönüştürülür.
                // The data from Firestore is converted into a UserModel object.
                let user = UserModel(data: userData)
                completion(user, nil)
            } else {
                // Belirtilen kullanıcı bulunamadı.
                // The specified user was not found.
                completion(nil, .userNotFound)
            }
        }
    }
    /**
     Mesaj gönderme işlemini gerçekleştirir.
     
     - Parameters:
       - message: Gönderilecek mesaj metni.
       - toUser: Mesajın gönderileceği kullanıcı modeli.
       - completion: İşlem tamamlandığında çağrılacak işlem bloğu. Hata durumunda Error nesnesi içerebilir.
    */
    static func sendMessage(message: String, toUser: UserModel, completion: @escaping (Error?) -> Void) {
        guard let currentUid = Auth.auth().currentUser?.uid else {
            completion(AppError.signInFailed(K.AppErrorLocalizedDescription.userSignInFailed))
            return
        }
        
        let messageData: [String: Any] = [
            "text": message,
            "fromId": currentUid,
            "toId": toUser.uid,
            "timestamp": Timestamp(date: Date())
        ]
        let messageCollectionPath = K.FireBaseConstants.FireStoreCollections.message
        let senderPath = "\(messageCollectionPath)/\(currentUid)/\(toUser.uid)"
        let receiverPath = "\(messageCollectionPath)/\(toUser.uid)/\(currentUid)"
        
        Firestore.firestore().collection(senderPath).addDocument(data: messageData) { error in
            if let error = error {
                completion(error)
            } else {
                Firestore.firestore().collection(receiverPath).addDocument(data: messageData) { error in
                    completion(error)
                }
            }
        }
    }
}

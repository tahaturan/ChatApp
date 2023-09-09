//
//  AuthenticationService.swift
//  ChatApp
//
//  Created by Taha Turan on 7.09.2023.
//

import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage
import Foundation
import UIKit

struct AuthenticationService {
    // Kullanıcı kaydını gerçekleştirir.
    // Registers a user.
    /**
     - Parameters:
        - user:
            -  Kullanıcının kaydı sırasında kullanılacak olan kullanıcı bilgilerini içeren UserModel örneği.
            -  An instance of UserModel that contains user information to be used during registration.
        - image: .
            -  Kullanıcının profil resmini temsil eden bir UIImage öğesi.
            - A UIImage object representing the user's profile picture.
        - completion:
            -  İşlemin sonucunu işlemek için kullanılacak olan kapanış (closure) fonksiyonu. Başarı durumunda Error değeri nil olurken, hata durumunda Error değeri ilgili hatayı tanımlar.
            -  A closure function that will be called when the operation is completed. The closure function is used to handle the result of the operation. In case of success, the Error value is nil, and in case of an error, the Error value defines the specific error.
     */
    static func registerUser(withUser user: UserModel, image: UIImage, completion: @escaping (Error?) -> Void) {
        // Profil resmini yüklemek için ayrı bir fonksiyon çağrılır.
        // A separate function is called to upload the profile image.
        uploadProfileImage(image) { result in
            switch result {
            case let .success(profileImageUrl):
                // Profil resmi başarıyla yüklendikten sonra kullanıcı oluşturma işlemi gerçekleştirilir.
                // After the profile image is successfully uploaded, user creation process is performed.
                createUser(withUser: user, profileImageUrl: profileImageUrl, completion: completion)
            case let .failure(error):
                // Hata durumunda ilgili işlem tamamlanır.
                // In case of an error, the appropriate action is taken.
                completion(error)
            }
        }
    }

    // Profil resmini Firebase Storage'a yükler ve URL döner.
    // Uploads the profile image to Firebase Storage and returns the URL.
    /**
     - Parameters:
        - image:
            -  Kullanıcının profil resmini temsil eden bir UIImage öğesi.
            -  A UIImage object representing the user's profile picture.
        - completion:
            -  İşlemin sonucunu işlemek için kullanılacak olan kapanış (closure) fonksiyonu. Başarı durumunda URL'yi içeren bir Result değeri ile çağrılır, hata durumunda Error değeri ilgili hatayı tanımlar.
            - İ A closure function that will be called when the operation is completed. In case of success, it is called with a Result value containing the URL, and in case of an error, it is called with an Error object defining the specific error.
     */
    private static func uploadProfileImage(_ image: UIImage, completion: @escaping (Result<String, Error>) -> Void) {
        guard let profileImageData = image.jpegData(compressionQuality: 0.5) else {
            // Profil resmi oluşturulamazsa ilgili hata döndürülür.
            // If the profile image cannot be created, the relevant error is returned.
            completion(.failure(AppError.profileImageCreationError))
            return
        }

        // her kullanıcı için benzersiz bir kimlik (UUID) oluşturur ve bu kimliği bir dize olarak 'photoName' değişkenine atar. Bu, her kullanıcının profil resmi için farklı bir dosya adı kullanılmasını sağlar.
        // generates a unique identifier (UUID) for each user and assigns it to the 'photoName' variable as a string. This ensures that a different file name is used for the profile picture of each user.
        let photoName = UUID().uuidString

        // Firebase Storage'da belirtilen yola göre bir referans (başvuru) oluşturur. 'photoName' değişkeni, dosyanın adını belirler. Bu yol, kullanıcıların profil resimlerini saklamak için belirli bir klasörün yolunu temsil eder.
        // creates a reference (pointer) based on the specified path in Firebase Storage. The 'photoName' variable determines the name of the file. This path represents the location for storing user profile images within a specific folder.
        let reference = Storage.storage().reference(withPath: "\(K.FireBaseConstants.FirebaseStorageConstans.profileImagePath)/\(photoName).png")

        reference.putData(profileImageData) { _, error in
            if error != nil {
                // Resim yükleme hatasıyla karşılaşılırsa ilgili hata döndürülür.
                // If there is an error while uploading the image, the relevant error is returned.
                completion(.failure(AppError.imageUploadError))
                return
            }

            reference.downloadURL { url, error in
                if error != nil {
                    // Resim indirme URL'si alınamazsa ilgili hata döndürülür.
                    // If the download URL for the image cannot be obtained, the relevant error is returned.
                    completion(.failure(AppError.downloadUrlError))
                    return
                }

                guard let profileImageUrl = url?.absoluteString else {
                    // Resim URL'si alınamazsa ilgili hata döndürülür.
                    // If the image URL cannot be obtained, the relevant error is returned.
                    completion(.failure(AppError.downloadUrlError))
                    return
                }

                // Başarılı durumda URL döndürülür.
                // In case of success, the URL is returned.
                completion(.success(profileImageUrl))
            }
        }
    }

    // Kullanıcıyı Firebase Authentication ile oluşturur ve Firestore'a kaydeder.
    // Creates a user with Firebase Authentication and records it in Firestore.
    /**
     - Parameters:
        - user:
            -  Yeni kullanıcının kaydı sırasında kullanılacak olan kullanıcı bilgilerini içeren UserModel örneği.
            -  An instance of UserModel that contains user information to be used during the creation of a new user.
        - profileImageUrl:
            -  Kullanıcının profil resminin yer aldığı URL.
            -  The URL where the user's profile picture is located.
        - completion:
            - İşlemin sonucunu işlemek için kullanılacak olan kapanış (closure) fonksiyonu. Başarı durumunda Error değeri nil olurken, hata durumunda Error değeri ilgili hatayı tanımlar.
            -  A closure function that will be called when the operation is completed. In case of success, it is called with nil, and in case of an error, it is called with an Error object defining the specific error.
     */
    private static func createUser(withUser user: UserModel, profileImageUrl: String, completion: @escaping (Error?) -> Void) {
        Auth.auth().createUser(withEmail: user.emailText, password: user.passwordText) { result, error in
            if error != nil {
                // Kullanıcı oluşturma hatasıyla karşılaşılırsa ilgili hata döndürülür.
                // If there is an error while creating the user, the relevant error is returned.
                completion(AppError.userCreationError)
                return
            }

            guard let userUid = result?.user.uid else {
                // Kullanıcı kimliği (UID) alınamazsa ilgili hata döndürülür.
                // If the user identity (UID) cannot be obtained, the relevant error is returned.
                completion(AppError.userCreationError)
                return
            }

            let userData: [String: Any] = [
                K.FireBaseConstants.FireStoreCollections.UserDataConstans.email: user.emailText,
                K.FireBaseConstants.FireStoreCollections.UserDataConstans.name: user.nameText,
                K.FireBaseConstants.FireStoreCollections.UserDataConstans.userName: user.userNameText,
                K.FireBaseConstants.FireStoreCollections.UserDataConstans.profileImageUrl: profileImageUrl,
                K.FireBaseConstants.FireStoreCollections.UserDataConstans.uid: userUid,
            ]

            Firestore.firestore().collection(K.FireBaseConstants.FireStoreCollections.users).document(userUid).setData(userData) { error in
                if error != nil {
                    // Firestore kayıt işlemi hatasıyla karşılaşılırsa ilgili hata döndürülür.
                    // If there is an error while recording in Firestore, the relevant error is returned.
                    completion(AppError.firestoreError)
                } else {
                    // Başarılı durumda hata döndürülmez (nil).
                    // In case of success, no error is returned (nil).
                    completion(nil)
                }
            }
        }
    }
}

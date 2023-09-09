//
//  AppError.swift
//  ChatApp
//
//  Created by Taha Turan on 9.09.2023.
//

import Foundation

enum AppError: Error {
    case signInFailed(String)
    case profileImageCreationError
    case imageUploadError
    case downloadUrlError
    case userCreationError
    case firestoreError

    var localizedDescription: String {
        switch self {
        case .profileImageCreationError:
            return K.AppErrorLocalizedDescription.profileImageCreationError
        case .imageUploadError:
            return K.AppErrorLocalizedDescription.imageUploadError
        case .downloadUrlError:
            return K.AppErrorLocalizedDescription.downloadUrlError
        case .userCreationError:
            return K.AppErrorLocalizedDescription.userCreationError
        case .firestoreError:
            return K.AppErrorLocalizedDescription.firestoreError
        case .signInFailed(let message):
            return message
        }
    }
}

//
//  AppDelegate.swift
//  ChatApp
//
//  Created by Taha Turan on 2.09.2023.
//

import FirebaseCore
import FirebaseAuth
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        window = UIWindow()
        window?.rootViewController = createStyledNavigationController(rootViewController: HomeViewController())
        window?.makeKeyAndVisible()
       
        return true
    }

    // Bu fonksiyon, özelleştirilmiş bir gezinme denetleyici oluşturur.
    // This function creates a customized navigation controller.
    private func createStyledNavigationController(rootViewController: UIViewController, barTintColor: UIColor = .white) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootViewController)

        // Gezinme çubuğu görünümünü yapılandır
        // Configure the navigation bar appearance
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.backgroundColor = K.Colors.darkDenimBlue
        navigationBarAppearance.titleTextAttributes = [.foregroundColor : UIColor.white]
        navigationBarAppearance.largeTitleTextAttributes = [.foregroundColor : UIColor.white]

        // Gezinme çubuğu görünümlerini ayarla
        // Set navigation bar appearances
        navigationController.navigationBar.standardAppearance = navigationBarAppearance
        navigationController.navigationBar.compactAppearance = navigationBarAppearance
        navigationController.navigationBar.scrollEdgeAppearance = navigationBarAppearance
        navigationController.navigationBar.compactScrollEdgeAppearance = navigationBarAppearance

        return navigationController
    }
}

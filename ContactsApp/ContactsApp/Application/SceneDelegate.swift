//
//  SceneDelegate.swift
//  ContactsApp
//
//  Created by Nikolai Maksimov on 02.01.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        let rootVC = UINavigationController(rootViewController: ContactListViewController())
        window?.rootViewController = rootVC
        window?.makeKeyAndVisible()
    }
}


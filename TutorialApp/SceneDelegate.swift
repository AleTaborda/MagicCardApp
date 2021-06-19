//
//  SceneDelegate.swift
//  TutorialApp
//
//  Created by Alejandro Exequiel Taborda on 10/06/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        
        let intialController = MainViewController()
        
        window.rootViewController = UINavigationController(rootViewController: intialController)
        window.makeKeyAndVisible()
    }
}


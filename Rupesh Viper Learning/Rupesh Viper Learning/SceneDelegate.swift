//
//  SceneDelegate.swift
//  Rupesh Viper Learning
//
//  Created by Rupeshkumar on 29/05/22.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            let router = HomeRouter.start()
            window.rootViewController = router.entry
            window.makeKeyAndVisible()
            self.window = window
        }
    }

}


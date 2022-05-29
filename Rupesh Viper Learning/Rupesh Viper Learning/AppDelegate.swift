//
//  AppDelegate.swift
//  Rupesh Viper Learning
//
//  Created by Rupeshkumar on 29/05/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //Lauch app below below iOS 13
        if #unavailable(iOS 13.0){
            let window = UIWindow(frame: UIScreen.main.bounds)
            let router = HomeRouter.start()
            window.rootViewController = router.entry
            window.makeKeyAndVisible()
            self.window = window
        }
        return true
    }

}

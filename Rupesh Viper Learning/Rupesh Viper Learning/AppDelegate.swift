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
        if #unavailable(iOS 13.0){
            self.window = UIWindow(frame: UIScreen.main.bounds)
            self.window!.rootViewController = ViewController()
            self.window!.makeKeyAndVisible()
        }
        return true
    }

}
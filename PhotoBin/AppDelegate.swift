//
//  AppDelegate.swift
//  PhotoBin
//
//  Created by Vipin Aggarwal on 24/04/20.
//  Copyright © 2020 Vipin Aggarwal. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        window?.rootViewController = HomeTabBarController()
        return true
    }
}


//
//  AppDelegate.swift
//  QRScanner
//
//  Created by Jatesh Kumar on 09/04/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let home = DashboardRouter.createModule()
        let nav = UINavigationController()
        nav.viewControllers = [home]
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        
//        UISegmentedControl.appearance().setTitleTextAttributes([
//            NSAttributedString.Key.foregroundColor: UIColor(named: "#32a852") as Any
//        ], for: .selected)
        
        return true
    }
}


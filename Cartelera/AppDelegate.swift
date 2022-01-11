//
//  AppDelegate.swift
//  Cartelera
//
//  Created by Leticia Echarri on 11/1/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: Coordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        if let window = window {
            coordinator = AppCoordinator(window)
            coordinator?.resolve()
        }
                
        return true
    }


}


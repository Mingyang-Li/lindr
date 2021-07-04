//
//  AppDelegate.swift
//  lindr
//
//  Created by Jamie Walker on 3/07/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var coordinator: Coordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        coordinator = Coordinator(window: window)
        coordinator?.start()
        
        return true
    }

}


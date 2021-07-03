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
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let navigationController = LindrNavigationController()
        let swipingViewModel = SwipingViewModel(navigationController: navigationController)
        let viewController = SwipingViewController(viewModel: swipingViewModel)
        
        navigationController.addChild(viewController)
        navigationController.setCentreView(centreView: viewController.view) 
        
        window = UIWindow()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }

}


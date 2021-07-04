//
//  Coordinator.swift
//  lindr
//
//  Created by Jamie Walker on 4/07/21.
//

import UIKit

class Coordinator {
    
    private var window: UIWindow?
    
    private(set) var navigationController = LindrNavigationController()
    private(set) var swipingViewController: SwipingViewController!
    private(set) var matchViewController: MatchViewController!
    private(set) var messagingViewController: MessagingViewController!
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        let swipingViewModel = SwipingViewModel(coordinator: self)
        swipingViewController = SwipingViewController(viewModel: swipingViewModel)
        navigationController.addChild(swipingViewController)
        navigationController.setCentreView(centreView: swipingViewController.view)
        
        window?.makeKeyAndVisible()
        window?.rootViewController = navigationController
    }
    
    func showMatchScreen(profile: ProfileViewModel) {
        let matchViewModel = MatchViewModel(profile: profile,
                                            coordinator: self)
        matchViewController = MatchViewController(viewModel: matchViewModel)
        matchViewController.modalPresentationStyle = .overFullScreen
        matchViewController.modalTransitionStyle = .crossDissolve
        
        navigationController.animateOut { (_) in
            self.swipingViewController.present(self.matchViewController, animated: true)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.matchViewController.animateIn()
            }
        }
    }
    
    func showMessagingScreen(profile: ProfileViewModel) {
        let messagingViewModel = MessagingViewModel(profile: profile,
                                                    coordinator: self)
        messagingViewController = MessagingViewController(viewModel: messagingViewModel)
        
        swipingViewController.removeFromParent()
        navigationController.addChild(messagingViewController)
        navigationController.setCentreView(centreView: messagingViewController.view)
        navigationController.navigationBarImage.accept(#imageLiteral(resourceName: "NavigationBarMessages"))
        
        matchViewController.animateOut { (_) in
            self.matchViewController.dismiss(animated: true) {
                self.navigationController.animateIn()
            }
        }
    }
    
}

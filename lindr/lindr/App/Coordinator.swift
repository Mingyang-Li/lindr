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
        let matchViewController = MatchViewController(viewModel: matchViewModel)
        matchViewController.modalPresentationStyle = .fullScreen
        matchViewController.modalTransitionStyle = .crossDissolve
        
        swipingViewController.fadeToWhite { (_) in
            self.swipingViewController.present(matchViewController, animated: true)
            matchViewController.animateIn()
        }
    }
    
}

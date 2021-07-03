//
//  LindrNavigationController.swift
//  lindr
//
//  Created by Jamie Walker on 3/07/21.
//

import UIKit
import Cartography



class LindrNavigationController: UIViewController {
    
    private(set) var centreView: UIView?
    private(set) var navigationBar = UIView()
    private(set) var tabBar = UIView()
    private var centreViewParentView = UIView()
    
    override func viewDidLoad() {
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(navigationBar)
        view.addSubview(tabBar)
        view.addSubview(centreViewParentView)
        setupConstraints()
        
        setupNavigationBar()
        setupTabBar()
    }
    
    private func setupConstraints() {
        constrain(view,
                  navigationBar,
                  tabBar,
                  centreViewParentView) { (view,
                                           navigationBar,
                                           tabBar,
                                           centreViewParentView) in
            navigationBar.top == view.top
            tabBar.bottom == view.bottom
            navigationBar.bottom == view.safeAreaLayoutGuide.top + 50
            tabBar.top == view.safeAreaLayoutGuide.bottom - 50
            
            centreViewParentView.top == navigationBar.bottom
            centreViewParentView.bottom == tabBar.top
            
            navigationBar.centerX == view.centerX
            navigationBar.width == view.width
            tabBar.centerX == view.centerX
            tabBar.width == view.width
            centreViewParentView.centerX == centreViewParentView.centerX
            centreViewParentView.width == centreViewParentView.width
        }
    }
    
    private func setupNavigationBar() {
        navigationBar.backgroundColor = .white
    }
    
    private func setupTabBar() {
        tabBar.backgroundColor = .white
    }
    
    func setCentreView(centreView: UIView) {
        self.centreView?.removeFromSuperview()
        self.centreView = centreView
        
        centreViewParentView.addSubview(centreView)
        
        constrain(centreView,
                  centreViewParentView) { (centreView,
                                           centreViewParentView) in
            centreView.edges == centreViewParentView.edges
        }
    }
    
}

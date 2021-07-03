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
        setupRootConstraints()
        
        setupNavigationBar()
        setupTabBar()
    }
    
    private func setupRootConstraints() {
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
        
        let imageView = UIImageView()
        navigationBar.addSubview(imageView)
        imageView.image = #imageLiteral(resourceName: "NavigationBar")
        imageView.contentMode = .scaleAspectFit
        imageView.contentMode = .scaleAspectFit
        
        constrain(imageView,
                  navigationBar) { (imageView,
                                    navigationBar) in
            imageView.edges == navigationBar.edges
        }
    }
    
    private func setupTabBar() {
        tabBar.backgroundColor = .white
        
        let imageView = UIImageView()
        tabBar.addSubview(imageView)
        imageView.image = #imageLiteral(resourceName: "nav bar")
        
        constrain(imageView,
                  navigationBar) { (imageView,
                                    navigationBar) in
            imageView.edges == navigationBar.edges
        }
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

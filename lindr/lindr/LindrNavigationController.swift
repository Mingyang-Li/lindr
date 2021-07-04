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
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    override func viewDidLoad() {
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
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
            
            tabBar.bottom == view.safeAreaLayoutGuide.bottom
            tabBar.width == 6 * tabBar.height
            tabBar.centerX == view.centerX
            tabBar.width == view.width
            
            centreViewParentView.top == navigationBar.bottom
            centreViewParentView.bottom == tabBar.top
            centreViewParentView.centerX == centreViewParentView.centerX
            centreViewParentView.width == view.width
            
            navigationBar.top == view.safeAreaLayoutGuide.top + 20
            navigationBar.centerX == view.centerX
            navigationBar.width == 0.6 * view.width
            navigationBar.height == 40
        }
    }
    
    private func setupNavigationBar() {
        navigationBar.backgroundColor = .white
        
        let imageView = UIImageView()
        navigationBar.addSubview(imageView)
        imageView.image = #imageLiteral(resourceName: "NavigationBar")
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
        imageView.contentMode = .scaleAspectFit
        
        constrain(imageView,
                  tabBar) { (imageView,
                             tabBar) in
            imageView.edges == tabBar.edges
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

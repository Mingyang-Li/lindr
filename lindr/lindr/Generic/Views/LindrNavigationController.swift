//
//  LindrNavigationController.swift
//  lindr
//
//  Created by Jamie Walker on 3/07/21.
//

import UIKit
import Cartography
import RxSwift
import RxCocoa

class LindrNavigationController: UIViewController {
    
    private(set) var centreView: UIView?
    private(set) var navigationBar = UIView()
    private(set) var tabBar = UIView()
    private var centreViewParentView = UIView()
    private let whiteView = UIView()
    
    private(set) lazy var navigationBarImage = BehaviorRelay<UIImage>(value: #imageLiteral(resourceName: "NavigationBar"))
    private(set) lazy var tabBarImage = BehaviorRelay<UIImage>(value: #imageLiteral(resourceName: "nav bar"))
    private let disposeBag = DisposeBag()
    
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
        setupWhiteView()
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
        imageView.contentMode = .scaleAspectFit
        
        constrain(imageView,
                  navigationBar) { (imageView,
                                    navigationBar) in
            imageView.edges == navigationBar.edges
        }
        
        navigationBarImage.bind { image in
            imageView.image = image
        }.disposed(by: disposeBag)
    }
    
    private func setupTabBar() {
        tabBar.backgroundColor = .white
        
        let imageView = UIImageView()
        tabBar.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        
        constrain(imageView,
                  tabBar) { (imageView,
                             tabBar) in
            imageView.edges == tabBar.edges
        }
        
        tabBarImage.bind { image in
            imageView.image = image
        }.disposed(by: disposeBag)
    }
    
    private func setupWhiteView() {
        view.addSubview(whiteView)
        
        whiteView.backgroundColor = .white
        whiteView.alpha = 0
        
        constrain(view, whiteView) { (view, whiteView) in
            whiteView.edges == view.edges
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
    
    func animateIn(completion: @escaping (Bool) -> () = { _ in }) {
        UIView.animate(withDuration: 0.3, animations: {
            self.whiteView.alpha = 0
        }, completion: completion)
    }
    
    func animateOut(completion: @escaping (Bool) -> () = { _ in }) {
        UIView.animate(withDuration: 0.3, animations: {
            self.whiteView.alpha = 1
        }, completion: completion)
    }
    
}

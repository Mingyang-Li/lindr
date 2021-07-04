//
//  BaseViewController.swift
//  lindr
//
//  Created by Jamie Walker on 4/07/21.
//

import UIKit
import Cartography

class BaseViewController: UIViewController {
    
    let whiteView = UIView()
    
    override func viewDidLoad() {
        setupUI()
    }
    
    private func setupUI() {
        setupWhiteView()
    }
    
    private func setupWhiteView() {
        view.addSubview(whiteView)
        whiteView.backgroundColor = .white
        constrain(view,
                  whiteView) { (view,
                                whiteView) in
            whiteView.edges == view.edges
        }
    }
    
}

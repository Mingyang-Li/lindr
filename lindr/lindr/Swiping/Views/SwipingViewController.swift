//
//  ViewController.swift
//  lindr
//
//  Created by Jamie Walker on 3/07/21.
//

import UIKit
import Cartography

class SwipingViewController: UIViewController {
    
    let viewModel: SwipingViewModel
    
    var likeButton = UIButton()
    var justBusinessButton = UIButton()
    
    let leftProfileView = ProfileView()
    let centreProfileView = ProfileView()
    let rightProfileView = ProfileView()
    
    init(viewModel: SwipingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        setupProfileViews()
        setupLikeAndBusinessButtons()
    }
    
    private func setupProfileViews() {
        view.addSubview(leftProfileView)
        view.addSubview(centreProfileView)
        view.addSubview(rightProfileView)
        
        constrain(view,
                  leftProfileView,
                  centreProfileView,
                  rightProfileView) { (view,
                                       leftProfileView,
                                       centreProfileView,
                                       rightProfileView) in
            centreProfileView.width == view.width * 0.75
            centreProfileView.height == view.height * 0.6
            centreProfileView.center == view.center
            
            leftProfileView.size == centreProfileView.size
            leftProfileView.centerY == view.centerY
            leftProfileView.right == view.left
            
            rightProfileView.size == centreProfileView.size
            rightProfileView.centerY == view.centerY
            rightProfileView.left == view.right
        }
    }
    
    private func setupLikeAndBusinessButtons() {
        
    }

}


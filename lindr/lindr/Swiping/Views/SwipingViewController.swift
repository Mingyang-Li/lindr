//
//  ViewController.swift
//  lindr
//
//  Created by Jamie Walker on 3/07/21.
//

import UIKit
import Cartography
import RxSwift

class SwipingViewController: UIViewController {
    
    let viewModel: SwipingViewModel
    let disposeBag = DisposeBag()
    
    var likeButton = UIButton()
    var justBusinessButton = UIButton()
    
    let topProfileView = ProfileView()
    let bottomProfileView = ProfileView()
    
    var minimumTranslationToSwipe: CGFloat {
        return view.bounds.width / 3
    }
    
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
        setupBindings()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        setupProfileViews()
        setupLikeAndBusinessButtons()
    }
    
    private func setupProfileViews() {
        view.addSubview(bottomProfileView)
        view.addSubview(topProfileView)
        
        constrain(view,
                  topProfileView,
                  bottomProfileView) { (view,
                                        topProfileView,
                                        bottomProfileView) in
            bottomProfileView.width == view.width * 0.75
            bottomProfileView.height == view.height * 0.6
            bottomProfileView.center == view.center
            
            topProfileView.size == bottomProfileView.size
            topProfileView.center == bottomProfileView.center
        }
    }
    
    private func setupLikeAndBusinessButtons() {
        
    }
    
    private func setupBindings() {
        viewModel.currentProfile.bind { [weak self] (viewModel) in
            self?.topProfileView.setViewModel(viewModel: viewModel)
        }.disposed(by: disposeBag)
        
        viewModel.nextProfile.bind { [weak self] (viewModel) in
            if let viewModel = viewModel {
                self?.bottomProfileView.setViewModel(viewModel: viewModel)
            } else {
                self?.bottomProfileView.isHidden = true
            }
        }.disposed(by: disposeBag)
        
        topProfileView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(topProfileViewPanned(gesture:))))
    }
    
    @objc private func topProfileViewPanned(gesture: UIPanGestureRecognizer) {
        let horizontalTranslation = gesture.translation(in: view).x
        
        if gesture.state == .ended {
            if horizontalTranslation <= -minimumTranslationToSwipe {
                doSwipeLeftAnimation()
            } else if horizontalTranslation >= minimumTranslationToSwipe {
                doSwipeRightAnimation()
            } else {
                doResetSwipeAnimation()
            }
        } else {
            topProfileView.transform = CGAffineTransform(translationX: horizontalTranslation, y: 0)
        }
    }
    
    private func doSwipeLeftAnimation() {
        UIView.animate(withDuration: 0.3) {
            self.topProfileView.transform = CGAffineTransform(translationX: -self.view.bounds.width, y: 0)
        } completion: { (_) in
            self.viewModel.profileSwipeLeft()
            self.doResetSwipeAnimation(animated: false)
        }
    }
    
    private func doSwipeRightAnimation() {
        UIView.animate(withDuration: 0.3) {
            self.topProfileView.transform = CGAffineTransform(translationX: self.view.bounds.width, y: 0)
        } completion: { (_) in
            self.viewModel.profileSwipeRight()
            self.doResetSwipeAnimation(animated: false)
        }
    }
    
    private func doResetSwipeAnimation(animated: Bool = true) {
        UIView.animate(withDuration: animated ? 0.3 : 0) {
            self.topProfileView.transform = .identity
        }
    }
    
}


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
    
    let likeAndJustBusinessButtonsParentView = UIView()
    let likeButton = RoundedIconButton()
    let justBusinessButton = RoundedIconButton()
    private let centerView = UIView()
    private let whiteView = UIView()
    
    let topProfileView = ProfileView()
    let bottomProfileView = ProfileView()
    let noMoreProfilesLabel = UILabel()
    
    private var minimumTranslationToSwipe: CGFloat {
        return view.bounds.width / 3
    }
    
    private var defaultBottomImageViewTransform: CGAffineTransform {
        return CGAffineTransform(scaleX: 0.9, y: 0.9).translatedBy(x: 0, y: -60)
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
        setupCentreView()
        setupNoMoreProfilesLabel()
        setupProfileViews()
        setupLikeAndBusinessButtons()
        setupWhiteView()
    }
    
    private func setupCentreView() {
        view.addSubview(centerView)
        
        constrain(view,
                  centerView) { (view,
                                 centerView) in
            centerView.center == view.center
            centerView.width == view.width - 60
            centerView.height == view.height - 100
        }
    }
    
    private func setupNoMoreProfilesLabel() {
        centerView.addSubview(noMoreProfilesLabel)
        noMoreProfilesLabel.text = Resources.noMoreProfiles
        noMoreProfilesLabel.textColor = UIColor(white: 1 / 2, alpha: 1)
        
        constrain(centerView,
                  noMoreProfilesLabel) { (view,
                                          noMoreProfilesLabel) in
            noMoreProfilesLabel.center == view.center
        }
    }
    
    private func setupProfileViews() {
        centerView.addSubview(bottomProfileView)
        centerView.addSubview(topProfileView)
        bottomProfileView.transform = defaultBottomImageViewTransform
        
        constrain(centerView,
                  topProfileView,
                  bottomProfileView) { (view,
                                        topProfileView,
                                        bottomProfileView) in
            bottomProfileView.centerX == view.centerX
            bottomProfileView.width == view.width
            bottomProfileView.height == view.height * 3 / 4
            bottomProfileView.top == view.top + 20
            
            topProfileView.size == bottomProfileView.size
            topProfileView.center == bottomProfileView.center
        }
    }
    
    private func setupLikeAndBusinessButtons() {
        centerView.addSubview(likeAndJustBusinessButtonsParentView)
        likeAndJustBusinessButtonsParentView.addSubview(likeButton)
        likeAndJustBusinessButtonsParentView.addSubview(justBusinessButton)
        
        likeButton.setIcon(Resources.love, sizeRatioToDot: 0.5)
        justBusinessButton.setIcon(Resources.justBusiness, sizeRatioToDot: 0.5)
        likeButton.backgroundColor = Resources.pink
        justBusinessButton.backgroundColor = Resources.blue
        
        constrain(view,
                  likeAndJustBusinessButtonsParentView,
                  likeButton,
                  justBusinessButton,
                  topProfileView) { (view,
                                     likeAndJustBusinessButtonsParentView,
                                     likeButton,
                                     justBusinessButton,
                                     topProfileView) in
            let size: CGFloat = 80
            let padding: CGFloat = 20
            
            likeAndJustBusinessButtonsParentView.bottom == view.safeAreaLayoutGuide.bottom
            likeAndJustBusinessButtonsParentView.top == topProfileView.bottom
            likeAndJustBusinessButtonsParentView.left == view.left
            likeAndJustBusinessButtonsParentView.right == view.right
            
            likeButton.centerY == likeAndJustBusinessButtonsParentView.centerY
            justBusinessButton.centerY == likeAndJustBusinessButtonsParentView.centerY
            likeButton.left == likeAndJustBusinessButtonsParentView.centerX + padding / 2
            justBusinessButton.right == likeAndJustBusinessButtonsParentView.centerX - padding / 2
            
            likeButton.width == size
            likeButton.height == likeButton.width
            justBusinessButton.size == likeButton.size
        }
    }
    
    private func setupWhiteView() {
        view.addSubview(whiteView)
        
        whiteView.backgroundColor = .white
        whiteView.alpha = 0
        
        constrain(view, whiteView) { (view, whiteView) in
            whiteView.edges == view.edges
        }
    }
    
    private func setupBindings() {
        viewModel.currentProfile.bind { [weak self] (viewModel) in
            if let viewModel = viewModel {
                self?.topProfileView.setViewModel(viewModel: viewModel)
            }
            self?.topProfileView.isHidden = viewModel == nil
        }.disposed(by: disposeBag)
        
        viewModel.nextProfile.bind { [weak self] (viewModel) in
            if let viewModel = viewModel {
                self?.bottomProfileView.setViewModel(viewModel: viewModel)
            }
            self?.bottomProfileView.isHidden = viewModel == nil
            
        }.disposed(by: disposeBag)
        
        topProfileView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(topProfileViewPanned(gesture:))))
        
        justBusinessButton.addTarget(self, action: #selector(doSwipeLeftAnimation), for: .touchUpInside)
        likeButton.addTarget(self, action: #selector(doSwipeRightAnimation), for: .touchUpInside)
    }
    
    @objc private func topProfileViewPanned(gesture: UIPanGestureRecognizer) {
        let horizontalTranslation = gesture.translation(in: view).x
        
        if gesture.state == .ended {
            if horizontalTranslation <= -minimumTranslationToSwipe {
                doSwipeLeftAnimation()
            } else if horizontalTranslation >= minimumTranslationToSwipe {
                doSwipeRightAnimation()
            } else {
                doCancelSwipeAnimation()
            }
        } else {
            topProfileView.transform = CGAffineTransform(translationX: horizontalTranslation, y: 0)
        }
    }
    
    @objc private func doSwipeLeftAnimation() {
        UIView.animate(withDuration: 0.3) {
            self.topProfileView.transform = CGAffineTransform(translationX: -self.view.bounds.width, y: 0)
            self.bottomProfileView.transform = .identity
        } completion: { (_) in
            self.viewModel.profileSwipeLeft()
            self.doResetSwipeAnimation()
        }
    }
    
    @objc private func doSwipeRightAnimation() {
        UIView.animate(withDuration: 0.3) {
            self.topProfileView.transform = CGAffineTransform(translationX: self.view.bounds.width, y: 0)
            self.bottomProfileView.transform = .identity
        } completion: { (_) in
            self.viewModel.profileSwipeRight()
            self.doResetSwipeAnimation()
        }
    }
    
    // Used if the user doesn't fully swipe in one direction, making the top profile view move back
    private func doCancelSwipeAnimation() {
        UIView.animate(withDuration: 0.3) {
            self.topProfileView.transform = .identity
            self.bottomProfileView.transform = self.defaultBottomImageViewTransform
        }
    }
    
    // Used after the swipe right/left animation once the next profile has been loaded
    private func doResetSwipeAnimation() {
        bottomProfileView.alpha = 0
        topProfileView.transform = .identity
        bottomProfileView.transform = defaultBottomImageViewTransform
        
        UIView.animate(withDuration: 0.3) {
            self.bottomProfileView.alpha = 1
        }
    }
    
    func fadeToWhite(completion: @escaping (Bool) -> () = { _ in }) {
        UIView.animate(withDuration: 0.3, animations: {
            self.whiteView.alpha = 1
        }, completion: completion)
    }
    
}

fileprivate struct Resources {
    
    static let noMoreProfiles = "No more profiles"
    
    static let blue = UIColor(displayP3Red: 5 / 255,
                              green: 110 / 255,
                              blue: 251 / 255,
                              alpha: 1)
    
    static let pink = UIColor(displayP3Red: 233 / 255,
                              green: 64 / 255,
                              blue: 87 / 255,
                              alpha: 1)
    
    static let love = UIImage(named: "Love")!
    static let justBusiness = UIImage(named: "JustBusiness")!
    
}

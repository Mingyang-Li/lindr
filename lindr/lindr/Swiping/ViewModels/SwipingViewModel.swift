//
//  SwipingViewModel.swift
//  lindr
//
//  Created by Jamie Walker on 3/07/21.
//

import UIKit
import RxSwift
import RxCocoa

class SwipingViewModel {
    
    private lazy var profiles = ProfileViewModelFactory.getProfileViewModels()
    
    lazy private(set) var currentProfile =
        BehaviorRelay<ProfileViewModel>(value: profiles[currentIndex])
    lazy private(set) var nextProfile =
        BehaviorRelay<ProfileViewModel?>(value: profiles[currentIndex + 1])
    
    private let currentIndex = 0
    
    private weak var navigationController: LindrNavigationController?
    
    init(navigationController: LindrNavigationController) {
        self.navigationController = navigationController
    }
    
    func profileSwipeLeft() {
        
    }
    
    func profileSwipeRight() {
        
    }
    
}


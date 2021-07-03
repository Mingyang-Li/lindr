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
        BehaviorRelay<ProfileViewModel?>(value: profiles[currentIndex])
    lazy private(set) var nextProfile =
        BehaviorRelay<ProfileViewModel?>(value: profiles[nextIndex])
    
    private var currentIndex = 0
    private var nextIndex: Int {
        return currentIndex + 1
    }
    
    private weak var navigationController: LindrNavigationController?
    
    init(navigationController: LindrNavigationController) {
        self.navigationController = navigationController
    }
    
    func profileSwipeLeft() {
        loadNextProfile()
    }
    
    func profileSwipeRight() {
        loadNextProfile()
    }
    
    private func loadNextProfile() {
        let currentNextProfile = nextProfile.value
        
        currentProfile.accept(currentNextProfile)
        currentIndex = nextIndex
        
        if nextIndex < profiles.count {
            nextProfile.accept(profiles[nextIndex])
        } else {
            nextProfile.accept(nil)
        }
    }
    
}


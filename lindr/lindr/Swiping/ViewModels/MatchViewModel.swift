//
//  MatchViewModel.swift
//  lindr
//
//  Created by Jamie Walker on 4/07/21.
//

import Foundation

class MatchViewModel {
    
    private(set) var profile: ProfileViewModel
    private(set) weak var coordinator: Coordinator?
    
    init(profile: ProfileViewModel,
         coordinator: Coordinator) {
        self.profile = profile
        self.coordinator = coordinator
    }
    
    func handleSayHello() {
        coordinator?.showMessagingScreen(profile: profile)
    }
    
    func handleKeepBrowsing() {
        
    }
    
}

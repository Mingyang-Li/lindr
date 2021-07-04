//
//  MessagingViewModel.swift
//  lindr
//
//  Created by Jamie Walker on 4/07/21.
//

import RxSwift
import RxCocoa

class MessagingViewModel {
    
    private let profile: ProfileViewModel
    private weak var coordinator: Coordinator?
    
    private(set) lazy var messageImage = BehaviorRelay<UIImage>(value: UIImage())
    
    init(profile: ProfileViewModel,
         coordinator: Coordinator) {
        self.profile = profile
        self.coordinator = coordinator
    }
    
    func showNextMessage() {
        
    }
    
}

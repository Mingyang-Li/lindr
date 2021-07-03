//
//  SwipingViewModel.swift
//  lindr
//
//  Created by Jamie Walker on 3/07/21.
//

import UIKit

class SwipingViewModel {
    
    var profiles = [ProfileViewModel]()
    
    private weak var navigationController: LindrNavigationController?
    
    init(navigationController: LindrNavigationController) {
        self.navigationController = navigationController
    }
    
}

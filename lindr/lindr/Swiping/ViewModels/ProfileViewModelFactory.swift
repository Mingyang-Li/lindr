//
//  ProfileViewModelFactory.swift
//  lindr
//
//  Created by Jamie Walker on 3/07/21.
//

import UIKit

struct ProfileViewModelFactory {
    
    static func getProfileViewModels() -> [ProfileViewModel] {
        
        return [
            ProfileViewModel(image: #imageLiteral(resourceName: "Profile1")),
            ProfileViewModel(image: #imageLiteral(resourceName: "Profile2")),
            ProfileViewModel(image: #imageLiteral(resourceName: "Profile3")),
            ProfileViewModel(image: #imageLiteral(resourceName: "Profile4"))
        ]
        
    }
    
}

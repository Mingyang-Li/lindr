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
            ProfileViewModel(image: #imageLiteral(resourceName: "Profile1"),
                             name: "Lisa",
                             incomeText: "35k"),
            ProfileViewModel(image: #imageLiteral(resourceName: "Profile2"),
                             name: "Lisa",
                             incomeText: "35k"),
            ProfileViewModel(image: #imageLiteral(resourceName: "Profile3"),
                             name: "Lisa",
                             incomeText: "35k"),
            ProfileViewModel(image: #imageLiteral(resourceName: "Profile4"),
                             name: "Lisa",
                             incomeText: "35k")
        ]
        
    }
    
}

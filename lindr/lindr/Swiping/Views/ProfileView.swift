//
//  ProfileView.swift
//  lindr
//
//  Created by Jamie Walker on 3/07/21.
//

import UIKit
import Cartography

class ProfileView: UIView {
    
    private var viewModel: ProfileViewModel?
    
    let profileImageView = UIImageView()
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViewModel(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
        applyViewModel()
    }
    
    private func setupUI() {
        profileImageView.contentMode = .scaleAspectFit
        addSubview(profileImageView)
        
        profileImageView.layer.cornerRadius = 20
        layer.shadowOpacity = 0.4
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.shadowRadius = 12
        
        constrain(self,
                  profileImageView) { (view,
                                       profileImageView) in
            profileImageView.edges == view.edges
        }
    }
    
    private func applyViewModel() {
        guard let viewModel = viewModel else { return }
        profileImageView.image = viewModel.image
    }
    
}

//
//  ProfileView.swift
//  lindr
//
//  Created by Jamie Walker on 3/07/21.
//

import UIKit

class ProfileView: UIView {
    
    private var viewModel: ProfileViewModel?
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        layer.cornerRadius = 20
    }
    
    func setViewModel(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
        setupUI()
    }
    
    private func setupUI() {
        guard let _ = viewModel else { return }
    }
    
}

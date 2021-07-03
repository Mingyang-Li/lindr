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
    let nameLabel = UILabel()
    let incomeLabel = UILabel()
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        layer.cornerRadius = 20
    }
    
    func setViewModel(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
        applyViewModel()
    }
    
    private func setupUI() {
        profileImageView.contentMode = .scaleAspectFill
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(incomeLabel)
        clipsToBounds = true
        
        constrain(self,
                  profileImageView,
                  nameLabel,
                  incomeLabel) { (view,
                                  profileImageView,
                                  nameLabel,
                                  incomeLabel) in
            let padding: CGFloat = 20
            profileImageView.edges == view.edges
            nameLabel.bottom == view.bottom - padding
            nameLabel.left == view.left + padding
            incomeLabel.top == view.top + padding
            incomeLabel.left == view.left + padding
        }
    }
    
    private func applyViewModel() {
        guard let viewModel = viewModel else { return }
        profileImageView.image = viewModel.image
        nameLabel.text = viewModel.name
        incomeLabel.text = viewModel.incomeText
    }
    
}

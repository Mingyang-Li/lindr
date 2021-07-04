//
//  MessagingViewController.swift
//  lindr
//
//  Created by Jamie Walker on 4/07/21.
//

import UIKit

class MessagingViewController: BaseViewController {
    
    private let viewModel: MessagingViewModel
    
    init(viewModel: MessagingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init(coder: NSCoder?) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        
    }
    
    private func setupMessageOverlay() {
        
    }
    
    func animateIn(completion: @escaping (Bool) -> () = { _ in }) {
        UIView.animate(withDuration: 0.3, animations: {
            self.whiteView.alpha = 0
        }, completion: completion)
    }

    func animateOut(completion: @escaping (Bool) -> () = { _ in }) {
        UIView.animate(withDuration: 0.3, animations: {
            self.whiteView.alpha = 1
        }, completion: completion)
    }
    
}

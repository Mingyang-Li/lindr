//
//  MatchViewController.swift
//  lindr
//
//  Created by Jamie Walker on 4/07/21.
//

import UIKit

class MatchViewController: UIViewController {
    
    private let viewModel: MatchViewModel
    
    init(viewModel: MatchViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init(coder: NSCoder?) {
        fatalError()
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .white
    }
    
    func animateIn() {
        
    }
    
}

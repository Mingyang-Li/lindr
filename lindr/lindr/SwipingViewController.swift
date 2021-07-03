//
//  ViewController.swift
//  lindr
//
//  Created by Jamie Walker on 3/07/21.
//

import UIKit
import Cartography

class SwipingViewController: UIViewController {
    
    let viewModel = SwipingViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
    }


}


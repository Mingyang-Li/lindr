//
//  RoundedButton.swift
//  lindr
//
//  Created by Jamie Walker on 3/07/21.
//

import UIKit

class RoundedButton: UIButton {
    
    override func layoutSubviews() {
        layer.cornerRadius = min(bounds.height, bounds.width) / 2
    }
    
}

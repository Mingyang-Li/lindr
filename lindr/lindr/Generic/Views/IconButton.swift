//
//  RoundedButton.swift
//  lindr
//
//  Created by Jamie Walker on 3/07/21.
//

import UIKit
import Cartography

class IconButton: UIButton {
    
    private let iconConstraintGroup = ConstraintGroup()
    
    lazy private var iconImageView: UIImageView = {
        let toReturn = UIImageView()
        toReturn.contentMode = .scaleAspectFit
        addSubview(toReturn)
        return toReturn
    }()
    
    var iconAlpha: CGFloat {
        get {
            return iconImageView.alpha
        }
        set {
            iconImageView.alpha = newValue
        }
    }
    
    var iconTintColor: UIColor {
        get {
            return iconImageView.tintColor
        }
        set {
            iconImageView.tintColor = newValue
        }
    }
    
    func setIcon(_ icon: UIImage?, sizeRatioToDot: CGFloat = 1) {
        iconImageView.image = icon
        
        constrain(iconImageView, self, replace: iconConstraintGroup) { (iconView, dot) in
            iconView.center == dot.center
            iconView.height == dot.height * sizeRatioToDot
            iconView.width == iconView.height
        }
    }
    
    
    
}

class RoundedIconButton: IconButton {
    
    override func layoutSubviews() {
        layer.cornerRadius = min(bounds.height, bounds.width) / 2
    }
    
}



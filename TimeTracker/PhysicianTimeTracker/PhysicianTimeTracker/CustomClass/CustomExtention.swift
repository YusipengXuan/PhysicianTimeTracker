//
//  CustomExtention.swift
//  PhysicianTimeTracker
//
//  Created by Ray Xuan on 4/10/18.
//  Copyright © 2018 ShippertLLC. All rights reserved.
//

import UIKit

class TextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5);
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
}

extension UISearchBar {
    var textField: UIView {
        for subView in self.subviews[0].subviews where subView is UITextField {
            return subView
        }
        return self
    }
}

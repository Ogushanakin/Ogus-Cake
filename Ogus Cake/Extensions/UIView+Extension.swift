//
//  UIView+Extension.swift
//  Ogus Cake
//
//  Created by AKIN on 23.06.2022.
//

import Foundation
import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}

//
//  View+extension.swift
//  CREDTask
//
//  Created by Vinoth on 28/09/22.
//

import Foundation
import UIKit

extension UIView {
    
    func roundAll(radius: CGFloat = 5) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner,
                                        .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    
    func roundTop(radius: CGFloat = 5) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }

    func roundBottom(radius: CGFloat = 5) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    
    func roundCorners() {
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.height/2
        self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner,
                                        .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
}

extension UIView {
    func applyBorder(with color: UIColor, width: CGFloat) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
    
    func removeBorder() {
        layer.borderColor = nil
        layer.borderWidth = 0
    }
    
    var snapshot: UIImage {
        let renderer = UIGraphicsImageRenderer(size: bounds.size)
        let image = renderer.image { _ in
            drawHierarchy(in: bounds, afterScreenUpdates: true)
        }
        return image
    }
}

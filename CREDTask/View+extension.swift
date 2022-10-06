//
//  View+extension.swift
//  CREDTask
//
//  Created by Vinoth on 29/09/22.
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
    
    func addPinnedSubview(_ subview: UIView, height: CGFloat? = nil, insets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)) {
        addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.topAnchor.constraint(equalTo: topAnchor, constant: insets.top).isActive = true
        subview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: insets.left).isActive = true
        subview.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -1.0 * insets.right).isActive = true
        subview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -1.0 * insets.bottom).isActive = true
        if let height = height {
            subview.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}

public extension UIStackView {
    convenience init(axis: NSLayoutConstraint.Axis, spacing: CGFloat? = nil, withAutoLayout: Bool = false) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = axis
        if let spacing = spacing {
            self.spacing = spacing
        }
    }

    func removeArrangedSubviews() {
        for oldSubview in arrangedSubviews {
            removeArrangedSubview(oldSubview)
            oldSubview.removeFromSuperview()
        }
    }

    func addArrangedSubviews(_ subviews: [UIView]) {
        subviews.forEach(addArrangedSubview)
    }
}

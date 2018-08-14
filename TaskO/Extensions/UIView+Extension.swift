//
//  UIView+Extension.swift
//  TaskO
//
//  Created by Ulan Nurmamatov on 8/15/18.
//  Copyright © 2018 Ulan Nurmamatov. All rights reserved.
//

import UIKit

extension UIView {
    @discardableResult
    func top(to anchor: NSLayoutYAxisAnchor, constant: CGFloat) -> UIView {
        topAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func leading(to anchor: NSLayoutXAxisAnchor, constant: CGFloat) -> UIView {
        leadingAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func trailing(to anchor: NSLayoutXAxisAnchor, constant: CGFloat) -> UIView {
        trailingAnchor.constraint(equalTo: anchor, constant: -constant).isActive = true
        return self
    }
    @discardableResult
    func bottom(to anchor: NSLayoutYAxisAnchor, constant: CGFloat) -> UIView {
        bottomAnchor.constraint(equalTo: anchor, constant: -constant).isActive = true
        return self
    }
    @discardableResult
    func centerX(to anchor: NSLayoutXAxisAnchor) -> UIView {
        centerXAnchor.constraint(equalTo: anchor).isActive = true
        return self
    }
    @discardableResult
    func centerY(to anchor: NSLayoutYAxisAnchor) -> UIView {
        centerYAnchor.constraint(equalTo: anchor).isActive = true
        return self
    }
    
    @discardableResult
    func width(constant: CGFloat) -> UIView {
        widthAnchor.constraint(equalToConstant: constant).isActive = true
        return self
    }
    @discardableResult
    func height(constant: CGFloat) -> UIView {
        heightAnchor.constraint(equalToConstant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func height(to anchor: NSLayoutDimension, multiplier: CGFloat) -> UIView {
        heightAnchor.constraint(equalTo: anchor, multiplier: multiplier).isActive = true
        return self
    }
    
    @discardableResult
    func width(to anchor: NSLayoutDimension, multiplier: CGFloat) -> UIView {
        widthAnchor.constraint(equalTo: anchor, multiplier: multiplier).isActive = true
        return self
    }
    
    func fillSuperView() {
        guard let superview = superview else {
            return
        }
        top(to: superview.topAnchor, constant: 0).bottom(to: superview.bottomAnchor, constant: 0)
            .trailing(to: superview.trailingAnchor, constant: 0).leading(to: superview.leadingAnchor, constant: 0)
    }
    
    func addSubViews(_ views: [UIView]) {
        views.forEach { (view) in
            self.addSubview(view)
        }
    }
}

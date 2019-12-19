//
//  UIView+AutoLayout.swift
//
//
//  Created by Seweryn Katolyk on 19.12.2019.
//  
//

import UIKit

extension UIView {
    func centerInSuperview() {
        centerHorizontallyInSuperview()
        centerVerticallyInSuperview()
    }
    
    func setSizeRelativeToSuperview(multiplier: CGFloat = 1) {
        setWidthRelativeToSuperviewWidth(multiplier: multiplier)
        setHeightRelativeToSuperviewHeight(multiplier: multiplier)
    }
    
    func fillSuperview() {
        centerInSuperview()
        setSizeRelativeToSuperview()
    }
    
    func setConstantWidth(_ width: CGFloat) {
        guard getSuperview() != nil else { return }
        addConstraint(NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: width))
    }
    
    func setConstantHeight(_ height: CGFloat) {
        guard getSuperview() != nil else { return }
        addConstraint(NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: height))
    }
    
    func centerHorizontallyInSuperview(constantOffset offset: CGFloat = 0) {
        addConstraint(from: .centerX, to: .centerX, constantOffset: offset)
    }
    
    func centerVerticallyInSuperview(constantOffset offset: CGFloat = 0) {
        addConstraint(from: .centerY, to: .centerY, constantOffset: offset)
    }
    
    func setWidthRelativeToSuperviewWidth(multiplier: CGFloat = 1) {
        addConstraint(from: .width, to: .width, multiplier: multiplier, constantOffset: 0)
    }
    
    func setHeightRelativeToSuperviewHeight(multiplier: CGFloat = 1) {
        addConstraint(from: .height, to: .height, multiplier: multiplier, constantOffset: 0)
    }
        
    func pinToSuperviewLeft(constantOffset offset: CGFloat = 0) {
        addConstraint(from: .leading, to: .leading, constantOffset: offset)
    }
    
    func pinToSuperviewRight(constantOffset offset: CGFloat = 0) {
        addConstraint(from: .trailing, to: .trailing, constantOffset: offset)
    }
    
    func pinToSuperviewTop(constantOffset offset: CGFloat = 0) {
        addConstraint(from: .top, to: .top, constantOffset: offset)
    }
    
    func pinToSuperviewBottom(constantOffset offset: CGFloat = 0) {
        addConstraint(from: .bottom, to: .bottom, constantOffset: offset)
    }
    
    func pinTopToViewBottom(_ view: AnyObject, constantOffset: CGFloat = 0) {
        addConstraint(from: .top, to: .bottom, view: view, constantOffset: constantOffset)
    }
}

extension UIView {
    func addConstraint(from attr1: NSLayoutConstraint.Attribute, to attr2: NSLayoutConstraint.Attribute, view: AnyObject? = nil, multiplier: CGFloat = 1, constantOffset: CGFloat) {
        guard let superview = getSuperview() else { return }
        superview.addConstraint(NSLayoutConstraint(item: self,
                                                   attribute: attr1,
                                                   relatedBy: .equal,
                                                   toItem: view ?? superview,
                                                   attribute: attr2,
                                                   multiplier: multiplier,
                                                   constant: constantOffset))
    }
    
    func getSuperview() -> UIView? {
        translatesAutoresizingMaskIntoConstraints = false
        if superview == nil {
            print("UIView autolayout requisites not filled, superview is nil")
        }
        return superview
    }
}

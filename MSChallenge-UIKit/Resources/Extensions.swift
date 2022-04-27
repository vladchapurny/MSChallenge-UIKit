//
//  Extensions.swift
//  MSChallenge-UIKit
//
//  Created by Vlad Chapurny on 2022-04-27.
//

import UIKit

// TODO: Probably separate Extensions in different classes.

// MARK: - UIButton Extensions
extension UIButton {
    
    /// Creates a custom button
    func customButton(title: String) {
        translatesAutoresizingMaskIntoConstraints = false
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        layer.cornerRadius = 20
        layer.masksToBounds = true
    }
}

// MARK: - UIView Extensions
extension UIView {
    /// Applies a custom Orange to Red to Pink gradient to the background
    func customGradient() {
        
        /// Making sure to not overflow the sublayers array with the same gradient by removing the gradient if it is already there
        if layer.sublayers?.first is CAGradientLayer {
            layer.sublayers?.first?.removeFromSuperlayer()
        }
        
        /// Creating custom gradient
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [UIColor.systemOrange.cgColor, UIColor.systemRed.cgColor, UIColor.systemPink.cgColor]
        gradient.startPoint = CGPoint.zero
        layer.insertSublayer(gradient, at: 0)
    }
}

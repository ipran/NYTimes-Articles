//
//  ShadowView.swift
//  NYTimes-Articles
//
//  Created by Pranil V P on 12/12/19.
//  Copyright © 2019 Pranil V P. All rights reserved.
//

import UIKit

@IBDesignable
class ShadowView: UIView {
    //MARK: - Outlets
    @IBInspectable var isShadowEnabled: Bool = false
    @IBInspectable var shadowWidth: CGFloat = -1
    @IBInspectable var shadowHeight: CGFloat = 2
    @IBInspectable var shadowColor: UIColor = .lightGray
    @IBInspectable var shadowColorOpacity: Float = 0.5
    @IBInspectable var shadowRadius: CGFloat = 4
    @IBInspectable var shouldRasterize: Bool = false
    //MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addShadow()
        
    }
    fileprivate func addShadow() {
        if isShadowEnabled {
            layer.masksToBounds = false
            layer.shadowColor = shadowColor.cgColor
            layer.shadowOpacity = shadowColorOpacity
            layer.shadowOffset = CGSize(width: shadowWidth, height: shadowHeight) // CGSize.zero
            layer.shadowRadius = shadowRadius
            layer.shouldRasterize = shouldRasterize
            
        }
        
    }
    
}


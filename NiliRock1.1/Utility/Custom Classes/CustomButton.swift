//
//  CustomButton.swift
//  NiliRock1.1
//
//  Created by Vijay's Braintech on 24/01/24.
//

import Foundation
import UIKit

class CustomButton: UIButton {
        
    override func awakeFromNib() {
        setGradientBackground(colorTop: UIColor.yellowGradientOne, colorBottom: UIColor.yellowGradientTwo)
        setTitleColor(Theme.buttonTextColor(), for: .normal)
        titleLabel?.font = UIFont(name: fontName.N_BoldBornStrong.rawValue , size: CGFloat(FontSize.size3))
        layer.cornerRadius = CGFloat(Radius.radius1)
        autoresizingMask = [.flexibleHeight, .flexibleWidth]
        layer.masksToBounds = true
    }
    
    func setGradientBackground(colorTop: UIColor, colorBottom: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorBottom.cgColor, colorTop.cgColor]
        gradientLayer.startPoint = CGPoint(x: 1, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 0)
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = UIScreen.main.bounds
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}

//
//  CustomTextField.swift
//  NiliRock1.1
//
//  Created by Vijay's Braintech on 24/01/24.
//

import Foundation
import UIKit


class CustomTextField: UITextField {
    var placeholderText: String? {
        didSet {
            let placeholderString = NSAttributedString(string: (self.placeholder ?? placeholderText)! , attributes: [NSAttributedString.Key.foregroundColor: Theme.placeholderTextColor()])
            self.attributedPlaceholder = placeholderString
            font = UIFont(name: fontName.N_RegularBornStrong.rawValue, size: CGFloat(FontSize.size3))
            textColor = Theme.headingTextColor()
        }
    }
    
}

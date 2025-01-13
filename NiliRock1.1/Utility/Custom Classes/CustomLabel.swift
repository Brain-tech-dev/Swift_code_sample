//
//  CustomLabel.swift
//  NiliRock1.1
//
//  Created by Vijay's Braintech on 24/01/24.
//

import Foundation
import UIKit



class CustomRegularLabel: UILabel {
    override func awakeFromNib() {
        textColor = Theme.textColor()
        font = UIFont(name: fontName.N_RegularBornStrong.rawValue, size: CGFloat(FontSize.size3))
    }
}

class CustomRegularLabel1: UILabel {
    override func awakeFromNib() {
        textColor = .white
        font = UIFont(name: fontName.N_RegularBornStrong.rawValue, size: CGFloat(FontSize.size3))
    }
}

class CustomRegularLabelYellow: UILabel {
    override func awakeFromNib() {
        textColor = .yellow
        font = UIFont(name: fontName.N_RegularBornStrong.rawValue, size: CGFloat(FontSize.size5))
    }
}
 
    
    class CustomExtraLargeLabel: UILabel {
        override func awakeFromNib() {
            textColor = Theme.headingTextColor()
            font = UIFont(name: fontName.N_BoldBornStrong.rawValue, size: CGFloat(FontSize.size5))
        }
    }
    
    class CustomLightLabel: UILabel {
        override func awakeFromNib() {
            textColor = UIColor.gray
            font = UIFont(name: fontName.N_BornStrongLight.rawValue, size: CGFloat(FontSize.size2))
        }
    }

class BoldLabelSize4: UILabel {
    override func awakeFromNib() {
        textColor = UIColor.white
        font = UIFont(name: fontName.N_BoldBornStrong.rawValue, size: 24)
    }
}


class SemiBoldLabelSize16: UILabel {
    override func awakeFromNib() {
        textColor = UIColor.white
        font = UIFont(name: fontName.N_BoldBornStrong.rawValue, size: 16)
    }
}

class SemiBoldLabelSize18: UILabel {
    override func awakeFromNib() {
        textColor = UIColor.yellowGradientTwo
        font = UIFont(name: fontName.N_BoldBornStrong.rawValue, size: 18)
    }
}

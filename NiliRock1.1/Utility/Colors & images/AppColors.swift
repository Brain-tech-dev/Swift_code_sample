//
//  AppColors.swift
//  NiliRock1.1
//
//  Created by Vijay's Braintech on 24/01/24.
//

import Foundation
import UIKit


struct Theme {
    
    static func textColor() -> UIColor {
        let themeColor = UIColor.gray
        return themeColor
    }
    
    static func buttonTextColor() -> UIColor {
        let themeColor = UIColor.black
        return themeColor
    }
    
    static func placeholderTextColor() -> UIColor {
        let themeColor = UIColor.lightGray
        return themeColor
    }
    
    static func headingTextColor() -> UIColor {
        let themeColor = UIColor.white
        return themeColor
    }
    
}


extension UIColor {
    // Base Colors
    static let blackColor = UIColor(red: 38.0/255, green: 38.0/255, blue: 38.0/255, alpha: 11)
    static let darkGrayColor1 = UIColor(red: 63.0/255, green: 66.0/255, blue: 70.0/255, alpha: 1)
    static let grayColor = UIColor(red: 167.0/255.0, green: 167.0/255.0, blue: 167.0/255.0, alpha: 1)
    static let lightGrayColor = UIColor(red: 220.0/255.0, green: 220.0/255.0, blue: 220.0/255.0, alpha: 1)
    static let moreLightGrayColor = UIColor(red: 245.0/255.0, green: 245.0/255.0, blue: 245.0/255.0, alpha: 1)
    static let moreLightBlueColor = UIColor(red: 237.0/255.0, green: 244.0/255.0, blue: 252.0/255.0, alpha: 1)
    
    //Accent Colors
    static let blueColor = UIColor(red: 19.0/255, green: 102.0/255, blue: 211.0/255, alpha: 1)
    static let greenColor = UIColor(red: 170.0/255, green: 208.0/255, blue: 85.0/255, alpha: 1)
    static let yellowColor = UIColor(red: 224/255, green: 169/255, blue: 17.0/255, alpha: 1)
    static let turquoiseColor = UIColor(red: 79.0/255, green: 209.0/255, blue: 217.0/255, alpha: 1)
    static let purpleColor = UIColor(red: 107.0/255, green: 110.0/255, blue: 249.0/255, alpha: 1)
    static let lilacColor = UIColor(red: 107.0/255, green: 110.0/255, blue: 249.0/255, alpha: 1)
    static let redColor = UIColor(red: 219.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1)
    static let orangeColor = UIColor(red: 227.0/255.0, green: 147.0/255.0, blue: 91.0/255.0, alpha: 1)
    static let lightBlueColor = UIColor(red: 95.0/255, green: 138.0/255, blue: 250.0/255, alpha: 1)
    
    static let yellowGradientOne = UIColor(red: 223.0/255.0, green: 188.0/255.0, blue: 135.0/255.0, alpha: 1)
    static let yellowGradientTwo = UIColor(red: 185.0/255, green: 140.0/255, blue: 62.0/255, alpha: 1)
    
    static let blueGradientOne = UIColor(red: 19/255, green: 69/255, blue: 162/255, alpha: 1)
//    static let blueGradientOne = UIColor(red: 19.0/255.0, green: 69.0/255.0, blue: 162.0/255.0, alpha: 1)
    static let blueGradientTwo = UIColor(red: 3.0/255, green: 20.0/255, blue: 90.0/255, alpha: 1)
    static let lessLightGrayColor = UIColor(red: 93.0/255, green: 94.0/255, blue: 93.0/255, alpha: 1)
    static let lightBlackColor = UIColor(red: 17.0/255, green: 17.0/255, blue: 17.0/255, alpha: 1)
    static let lightBlackColor1 = UIColor(red: 28.0/255, green: 28.0/255, blue: 28.0/255, alpha: 1)
    static let darkGrayColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
     
    //toastColor
    static let redTostColor = UIColor(red: 235/255, green: 87/255, blue: 87/255, alpha: 1)
    static let greenTostColor = UIColor(red: 111.0/255.0, green: 207.0/255.0, blue: 151.0/255.0, alpha: 1)

}


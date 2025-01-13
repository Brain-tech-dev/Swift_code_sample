//
//  TabBarViewController.swift
//  NiliRock1.1
//
//  Created by Vijay's Braintech on 25/01/24.
//

import UIKit

class TabBarViewController: UITabBarController {
 
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().unselectedItemTintColor = .white
        UITabBar.appearance().selectedImageTintColor = UIColor.yellowGradientTwo
        let appearance = UITabBarItem.appearance()
        let attributes = [NSAttributedString.Key.font:UIFont(name: fontName.N_BoldBornStrong.rawValue, size: 12)]
        appearance.setTitleTextAttributes(attributes as [NSAttributedString.Key : Any], for: .normal)
        if let userType = UserDefaults.standard.object(forKey: Constants.Keys.loginType) as? String {
            if userType == UserType.athlete.rawValue {
                let index = 1
                viewControllers?.remove(at: index)
            }
        }
    }
}

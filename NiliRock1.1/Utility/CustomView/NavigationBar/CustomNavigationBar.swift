//
//  CustomNavigationBar.swift
//  NiliRock1.1
//
//  Created by Vijay's Braintech on 29/01/24.
//

import UIKit

class CustomNavigationBar: UIView {
    
    //MARK: - OUTLETS
    @IBOutlet var notificationBellView: UIView!
    @IBOutlet var titleImageView: UIImageView!
    @IBOutlet var notificationImageView: UIImageView!
    @IBOutlet var backButton: UIButton!
    //MARK: - Properties
    var didClickBackButton: (() -> Void)?
    var didClickNotificationButton: (() -> Void)?
    var didClickMenu: (() -> Void)?
    
    
    //MARK: - LIFECYCLE
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: - HELPERS
    func configureUI(with backImageIcon: UIImage?, tintColor: UIColor, notificationImageIcon: UIImage?) {
        titleImageView.image = Icons.navigationlogo
        backButton.setImage(backImageIcon, for: .normal)
        backButton.tintColor = tintColor
        titleImageView.image = Icons.navigationlogo
     }
    
    @IBAction func backButtonAction(_ sender: Any) {
        didClickBackButton?()
    }
    
    @IBAction func notificationBellClickAction(_ sender: Any) {
        didClickNotificationButton?()
    }
    
    
    
}

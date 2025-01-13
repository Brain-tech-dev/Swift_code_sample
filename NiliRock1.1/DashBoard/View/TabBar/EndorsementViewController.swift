//
//  EndorsementViewController.swift
//  NiliRock1.1
//
//  Created by Vijay's Braintech on 06/02/24.
//

import UIKit

class EndorsementViewController: UIViewController {
  
    //MARK: - OUTLETS
    
    @IBOutlet var mainContainerView: UIView!
    @IBOutlet var navigationBar: CustomNavigationBar!
    @IBOutlet var container: UIView!
    
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        confiqureUI()
        configureNavigation()
    }
    
    //MARK: - HELPERS
    func configureNavigation() {
        let navigationBar = Bundle.main.loadNibNamed("ResuableView", owner: self, options: nil)?.first as? CustomNavigationBar
        if let navigationView = navigationBar {
            navigationView.configureUI(with: nil, tintColor: UIColor.white, notificationImageIcon: nil)
            navigationView.didClickBackButton = {
                self.navigationController?.popViewController(animated: false)
            }
        }
        navigationBar?.backgroundColor = .lightBlackColor
        navigationBar?.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        navigationBar?.frame = self.navigationBar.bounds
        self.navigationBar.addSubview(navigationBar!)
    }

    func confiqureUI() {
        mainContainerView.backgroundColor = UIColor.lightBlackColor
        container.backgroundColor = UIColor.blackColor
        container.layer.cornerRadius = Radius.radius1
    }
    
    
    
}

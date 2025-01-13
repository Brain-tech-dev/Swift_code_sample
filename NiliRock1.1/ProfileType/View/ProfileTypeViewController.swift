//
//  ProfileTypeViewController.swift
//  NiliRock1.1
//
//  Created by Vijay's Braintech on 25/01/24.
//

import UIKit

class ProfileTypeViewController: UIViewController {
    
    //MARK: - OUTLETS
    @IBOutlet var atheleteButton: CustomButton!
    @IBOutlet var bussinessBrandButton: UIButton!
    @IBOutlet var maincontainer: UIView!
    @IBOutlet var backgroiundImage: UIImageView!
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        confiqureUI()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //MARK: - HELPERS
    func confiqureUI() {
        bussinessBrandButton.layer.cornerRadius = CGFloat(Radius.radius1)
        bussinessBrandButton.backgroundColor = UIColor.blackColor
        bussinessBrandButton.setTitleColor(Theme.headingTextColor(), for: .normal)
    }
    
    //MARK: - BUTTON ACTION
    @IBAction func loginAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
    
    @IBAction func atheleteButtonAction(_ sender: Any) {
        let storyBoard = UIStoryboard(name: StoryboardName.AtheleteRegisterStoryboard, bundle: nil)
        let nextVc = storyBoard.instantiateViewController(withIdentifier: "AtheleteRegisterOneViewController") as! AtheleteRegisterOneViewController
        self.navigationController?.pushViewController(nextVc, animated: false)
    }
    
    
    @IBAction func bussinessBrandAction(_ sender: Any) {
        
    }
}

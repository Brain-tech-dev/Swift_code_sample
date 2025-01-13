//
//  ForgotPasswordViewController.swift
//  NiliRock1.1
//
//  Created by Vijay's Braintech on 09/02/24.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    //MARK: - OUTLETS
    
    
    @IBOutlet var mainContaineer: UIView!
    @IBOutlet var email: CustomTextField!
    @IBOutlet var submitButton: CustomButton!
    @IBOutlet var emailContainerView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confiqureUI()
    }
    
    func confiqureUI() {
        mainContaineer.backgroundColor = UIColor.lightBlackColor
        emailContainerView.backgroundColor = .darkGrayColor1
        emailContainerView.layer.cornerRadius = Radius.radius1
        email.placeholderText = Titles.emailTitle
    }

    @IBAction func BackToLogin(_ sender: Any) {
        print("hii")
        self.navigationController?.popViewController(animated: false)
    }
    
    
    
    
}

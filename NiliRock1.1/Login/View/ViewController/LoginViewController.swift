//
//  LoginViewController.swift
//  NiliRock1.1
//
//  Created by Vijay's Braintech on 24/01/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var applogoImageView: UIImageView!
    @IBOutlet weak var emailContainerView: UIView!
    @IBOutlet weak var passwordContainerView: UIView!
    @IBOutlet weak var forgotPasswordContainerView: UIView!
    @IBOutlet weak var loginButton: CustomButton!
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var passwordTextfield: CustomTextField!
    @IBOutlet var eyeImage: UIImageView!
    @IBOutlet var mainContainer: UIView!
    
    //MARK: - PROPERTIES
    var viewModel = LoginViewModel()
    var isShowPassword: Bool = false
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        let userToken = UserDefaults.standard.object(forKey: Constants.Keys.accessToken)
        if userToken != nil {
            let storyBoard = UIStoryboard(name: StoryboardName.dashboardStoryboard, bundle: nil)
            let nextVc = storyBoard.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
            self.navigationController?.pushViewController(nextVc, animated: false)
        } else {
            configureUI()
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //MARK: - HELPERS
    func configureUI() {
        loginButton.setTitle(Titles.login, for: .normal)
        emailContainerView.backgroundColor = UIColor.darkGray
        emailContainerView.layer.cornerRadius = Radius.radius1
        passwordContainerView.backgroundColor = UIColor.darkGray
        passwordContainerView.layer.cornerRadius = Radius.radius1
        emailTextField.placeholderText = Titles.emailTitle
        passwordTextfield.placeholderText = Titles.passwordTitle
        emailTextField.keyboardType = .emailAddress
        emailTextField.keyboardAppearance = .dark
        passwordTextfield.keyboardAppearance = .dark
        emailTextField.delegate = self
        passwordTextfield.delegate = self
        passwordTextfield.isSecureTextEntry = true
        mainContainer.backgroundColor = UIColor.lightBlackColor
        let tap = UITapGestureRecognizer(target: self, action: #selector(closeKeyBoard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func closeKeyBoard() {
        view.endEditing(true)
    }
    
    private func configureShowPassword() {
        if isShowPassword == true {
            eyeImage.image = Icons.openEye
            passwordTextfield.isSecureTextEntry = false
        } else {
            eyeImage.image = Icons.closeEye
            passwordTextfield.isSecureTextEntry = true
        }
    }
    
    //MARK: - BUTTON ACTION
    @IBAction func passwordHideShowAction(_ sender: Any) {
        isShowPassword = !isShowPassword
        configureShowPassword()
    }
    
    @IBAction func facebookLoginAction(_ sender: Any) {
    }
    
    @IBAction func googleLogin(_ sender: Any) {
        
    }
    
    @IBAction func appleLoginAction(_ sender: Any) {
        
    }
    
    @IBAction func AccountCreateAction(_ sender: Any) {
        print("rahul")
        let storyBoard = UIStoryboard(name: StoryboardName.dashboardStoryboard, bundle: nil)
        let nextVc = storyBoard.instantiateViewController(withIdentifier: "ProfileTypeViewController") as! ProfileTypeViewController
        self.navigationController?.pushViewController(nextVc, animated: false)
    }
    
    @IBAction func LoginButtonAction(_ sender: Any) {
        viewModel.email = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        viewModel.password = passwordTextfield.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        if let result = viewModel.validations() {
            self.showToast(message: result, errorType: .error)
        } else {
            self.login()
        }
    }
    
    @IBAction func forgotPasswordAction(_ sender: Any) {
        let storyBoard = UIStoryboard(name: StoryboardName.dashboardStoryboard, bundle: nil)
        let nextVc = storyBoard.instantiateViewController(withIdentifier: "ForgotPasswordViewController") as! ForgotPasswordViewController
        self.navigationController?.pushViewController(nextVc, animated: false)
    }
    
}

//MARK: - UITextFieldDelegate
extension LoginViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            passwordTextfield.becomeFirstResponder()
        } else if textField == passwordTextfield {
            passwordTextfield.resignFirstResponder()
        }
        return true
    }
}

//MARK: - API Call
extension LoginViewController {
    
    func login() {
        viewModel.login(with: viewModel.param(), completionHandler: { data, error in
            if let data = data {
                if let status = data.status {
                    if status == 1 {
                        SaveUserDetails.saveUserDetails(with: data.data)
                        let storyBoard = UIStoryboard(name: StoryboardName.dashboardStoryboard, bundle: nil)
                        let nextVc = storyBoard.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
                        self.navigationController?.pushViewController(nextVc, animated: false)
                    } else {
                        if let message = data.message {
                            self.showToast(message: message, errorType: .error)
                        }
                    }
                }
            }
        })
    }
}

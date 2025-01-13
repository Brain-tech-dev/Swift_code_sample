//
//  AtheleteRegisterOneViewController.swift
//  NiliRock1.1
//
//  Created by Vijay's Braintech on 29/01/24.
//

import UIKit

class AtheleteRegisterOneViewController: UIViewController {
    
    //MARK: - OUTLETS
    @IBOutlet var formContainerView: UIView!
    @IBOutlet var navigationbar: CustomNavigationBar!
    @IBOutlet var mainContainer: UIView!
    @IBOutlet var progrssBar: UIProgressView!
    @IBOutlet var formTitle: CustomRegularLabel!
    @IBOutlet var firstNameView: UIView!
    @IBOutlet var secoundNameView: UIView!
    @IBOutlet var emailView: UIView!
    @IBOutlet var phoneNumberView: UIView!
    @IBOutlet var passwordView: UIView!
    @IBOutlet var confirmPassword: UIView!
    @IBOutlet var termsAndConditionContainerView: UIView!
    @IBOutlet var checkBoxImageView: UIImageView!
    @IBOutlet var termsAndConditionLabel: CustomRegularLabel!
    @IBOutlet var submitButton: CustomButton!
    @IBOutlet var firstNameTextField: CustomTextField!
    @IBOutlet var secoundNameTextField: CustomTextField!
    @IBOutlet var emailTextField: CustomTextField!
    @IBOutlet var phoneNumberTextField: CustomTextField!
    @IBOutlet var passwordTextField: CustomTextField!
    @IBOutlet var ConfirmPasswordTextField: CustomTextField!
    @IBOutlet var femaleButton: UIButton!
    @IBOutlet var maleButton: UIButton!
    
    //MARK: - PROPERTIES
    var genderType: Gender = .male
    var isAcceptTerms: Bool = false
    var viewModel = AthleteRegisterOneViewModel()
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureGenderType(type: genderType)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //MARK: - HELPERS
    func configureNavigation() {
        let navigationBar = Bundle.main.loadNibNamed("ResuableView", owner: self, options: nil)?.first as? CustomNavigationBar
        if let navigationView = navigationBar {
            navigationView.configureUI(with: Icons.back, tintColor: UIColor.white, notificationImageIcon: nil)
            navigationView.didClickBackButton = {
                self.navigationController?.popViewController(animated: false)
            }
        }
        navigationBar?.backgroundColor = .lightBlackColor
        navigationBar?.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        navigationBar?.frame = self.navigationbar.bounds
        self.navigationbar.addSubview(navigationBar!)
    }
    
    func configureUI() {
        formContainerView.layer.cornerRadius = Radius.radius2
        mainContainer.backgroundColor = UIColor.lightBlackColor
        formContainerView.backgroundColor = UIColor.blackColor
        firstNameView.backgroundColor = UIColor.darkGrayColor
        firstNameView.layer.cornerRadius = Radius.radius1
        secoundNameView.backgroundColor = UIColor.darkGrayColor
        secoundNameView.layer.cornerRadius = Radius.radius1
        emailView.backgroundColor = UIColor.darkGrayColor
        emailView.layer.cornerRadius = Radius.radius1
        phoneNumberView.backgroundColor = UIColor.darkGrayColor
        phoneNumberView.layer.cornerRadius = Radius.radius1
        passwordView.backgroundColor = UIColor.darkGrayColor
        passwordView.layer.cornerRadius = Radius.radius1
        confirmPassword.backgroundColor = UIColor.darkGrayColor
        confirmPassword.layer.cornerRadius = Radius.radius1
        
        firstNameTextField.placeholderText = Titles.firstNameTitle
        secoundNameTextField.placeholderText = Titles.lastNameTitle
        emailTextField.placeholderText = Titles.emailTitle
        passwordTextField.placeholderText = Titles.passwordTitle
        phoneNumberTextField.placeholderText = Titles.phoneTitle
        passwordTextField.placeholderText = Titles.passwordTitle
        ConfirmPasswordTextField.placeholderText = Titles.confirmPasswordTitle
        firstNameTextField.keyboardAppearance = .dark
        secoundNameTextField.keyboardAppearance = .dark
        emailTextField.keyboardAppearance = .dark
        emailTextField.keyboardType = .emailAddress
        phoneNumberTextField.keyboardAppearance = .dark
        phoneNumberTextField.keyboardType = .numberPad
        passwordTextField.keyboardAppearance = .dark
        ConfirmPasswordTextField.keyboardAppearance = .dark
        phoneNumberTextField.returnKeyType = .next
        
        firstNameTextField.delegate = self
        secoundNameTextField.delegate = self
        emailTextField.delegate = self
        phoneNumberTextField.delegate = self
        passwordTextField.delegate = self
        ConfirmPasswordTextField.delegate = self
        
        submitButton.setTitle(Titles.Continue, for: .normal)
        progrssBar.progress = 0.1
        checkBoxImageView.tintColor = UIColor.white
    }
    
    private func configureGenderType(type: Gender) {
        genderType = type
        switch type {
        case .male:
            maleButton.setImage(Icons.radioSelect, for: .normal)
            femaleButton.setImage(Icons.radioDefault, for: .normal)
            self.genderType = .male
        case .female:
            femaleButton.setImage(Icons.radioSelect, for: .normal)
            maleButton.setImage(Icons.radioDefault, for: .normal)
            self.genderType = .female
        }
    }
    
    private func configureTermsAndCondition(isAccept: Bool) {
        if isAccept {
            checkBoxImageView.image = Icons.checkBlue
        } else {
            checkBoxImageView.image = Icons.uncheckBlue
        }
    }
    
    //MARK: - BUTTON ACTION
    @IBAction func maleButtonCheckBox(_ sender: Any) {
        configureGenderType(type: .male)
    }
    
    @IBAction func femaleCheckBox(_ sender: Any) {
        configureGenderType(type: .female)
    }
    
    @IBAction func continueButtonAction(_ sender: Any) {
        viewModel.isSelectedGender = self.genderType
        viewModel.firstName = self.firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        viewModel.lastName = self.secoundNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        viewModel.password = self.passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        viewModel.phone = self.phoneNumberTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        viewModel.confirmPassword = self.ConfirmPasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        viewModel.email = self.emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        viewModel.isAcceptedTerms = self.isAcceptTerms
        
        if let message = viewModel.validations() {
            self.showToast(message: message, errorType: .error)
        } else {
            registerAthelete()
            //                        let storyBoard = UIStoryboard(name: StoryboardName.AtheleteRegisterStoryboard, bundle: nil)
            //                        let nextVC = storyBoard.instantiateViewController(withIdentifier: "AthleteRegisterTwoViewController") as! AthleteRegisterTwoViewController
            //                        self.navigationController?.pushViewController(nextVC, animated: false)
        }
        
    }
    
    @IBAction func termsAndConditionButton(_ sender: UIButton) {
        isAcceptTerms = !isAcceptTerms
        self.configureTermsAndCondition(isAccept: self.isAcceptTerms)
    }
}

//MARK: - UITextField Delegate
extension AtheleteRegisterOneViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == firstNameTextField {
            secoundNameTextField.becomeFirstResponder()
        } else if textField == secoundNameTextField {
            emailTextField.becomeFirstResponder()
        } else if textField == emailTextField {
            phoneNumberTextField.becomeFirstResponder()
        } else if textField == phoneNumberTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            ConfirmPasswordTextField.becomeFirstResponder()
        } else {
            ConfirmPasswordTextField.resignFirstResponder()
        }
        return true
    }
}

//MARK: - Api-calling
extension AtheleteRegisterOneViewController {
    func registerAthelete() {
        self.viewModel.registerAthlete(with: self.viewModel.param(), completionHandler: { data, error in
            if let data = data {
                if let status = data.status {
                    if status == 1 {
                        SaveUserDetails.saveRegisterDetails(with: data)
                        let storyBoard = UIStoryboard(name: StoryboardName.AtheleteRegisterStoryboard, bundle: nil)
                        let nextVC = storyBoard.instantiateViewController(withIdentifier: "AthleteRegisterTwoViewController") as! AthleteRegisterTwoViewController
                        self.navigationController?.pushViewController(nextVC, animated: false)
                    } else {
                        DispatchQueue.main.async {
                            if let message = data.message {
                                self.showToast(message: message, errorType: .error)
                            }
                        }
                    }
                }
            }
            
            if error != nil {
                DispatchQueue.main.async {
                    if let error = error {
                        self.showToast(message: error, errorType: .error)
                    }
                }
            }
        })
    }
}

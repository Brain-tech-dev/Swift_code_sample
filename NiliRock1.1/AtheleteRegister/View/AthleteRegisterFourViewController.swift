//
//  AthleteRegisterFourViewController.swift
//  NiliRock1.1
//
//  Created by Vijay's Braintech on 30/01/24.
//

import UIKit
import DropDown

class AthleteRegisterFourViewController: UIViewController {
    
    //MARK: - OUTLETS
    @IBOutlet var mainContainer: UIView!
    @IBOutlet var navigationBar: CustomNavigationBar!
    @IBOutlet var containerView: UIView!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var titleLabel: BoldLabelSize4!
    @IBOutlet var collegeTitleLabel: BoldLabelSize4!
    @IBOutlet var countaryConatinerView: UIView!
    @IBOutlet var stateContainerView: UIView!
    @IBOutlet var collegecontainerView: UIView!
    @IBOutlet var collegeTextField: CustomTextField!
    @IBOutlet var pinCodeView: UIView!
    @IBOutlet var pinCodeTextField: CustomTextField!
    @IBOutlet var countryTextField: CustomTextField!
    @IBOutlet var stateTextField: CustomTextField!
    @IBOutlet var skipButton: CustomButton!
    @IBOutlet var continueButton: CustomButton!
    
    
    //MARK: - PROPERTIES
    let dropdown = DropDown()
    var viewModel = AthleteRegisterFourViewModel()
    var arrayOfCountry = [CountryData]()
    var arrayOfstate = [CountryData]()
    var arrayOfCollege = [CountryData]()
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getCountryList()
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
        navigationBar?.frame = self.navigationBar.bounds
        self.navigationBar.addSubview(navigationBar!)
    }
    
    func configureUI() {
        mainContainer.backgroundColor = .lightBlackColor
        containerView.backgroundColor = UIColor.blackColor
        containerView.layer.cornerRadius = Radius.radius1
        countaryConatinerView.backgroundColor = UIColor.darkGrayColor
        countaryConatinerView.layer.cornerRadius = Radius.radius1
        stateContainerView.backgroundColor = UIColor.darkGrayColor
        stateContainerView.layer.cornerRadius = Radius.radius1
        pinCodeView.backgroundColor = UIColor.darkGrayColor
        pinCodeView.layer.cornerRadius = Radius.radius1
        collegecontainerView.backgroundColor = UIColor.darkGrayColor
        collegecontainerView.layer.cornerRadius = Radius.radius1
        countryTextField.placeholderText = Titles.selectCountry
        stateTextField.placeholderText = Titles.selectState
        pinCodeTextField.placeholderText = Titles.enterPin
        collegeTextField.placeholderText = Titles.selectCollege
        skipButton.setTitle("Skip", for: .normal)
        continueButton.setTitle("Continue", for: .normal)
    }
    
    private func configureColorDropdown(with view: UIView, and dataValues: [CountryData]?, decreaseWidth: Bool) {
        self.view.endEditing(true) // to close open keyboard
        dropdown.anchorView = view
        if decreaseWidth {
            dropdown.width = view.frame.width - 150
        } else {
            dropdown.width = view.frame.width
        }
        dropdown.bottomOffset = CGPoint(x: 0, y: view.bounds.height)
        dropdown.textColor = UIColor.white
        dropdown.layer.masksToBounds = true
        dropdown.cornerRadius = 5
        dropdown.backgroundColor = UIColor.darkGrayColor
        dropdown.selectionBackgroundColor = UIColor.white
        
        var datasource = [String]()
        if let values = dataValues {
            for value in values {
                let value = value.name
                datasource.append("\(value)")
            }
        }
        dropdown.dataSource = datasource
    }
    
    
    //MARK: - BUTTON ACTION
    @IBAction func selectCountryAction(_ sender: UIButton) {
        self.configureColorDropdown(with: self.countaryConatinerView, and: arrayOfCountry, decreaseWidth: false)
        self.dropdown.show()
        self.dropdown.selectionAction = { (index: Int, name: String) in
            self.countryTextField.text = self.arrayOfCountry[index].name
            self.viewModel.countryId = self.arrayOfCountry[index].id
            self.getStateList(id: self.arrayOfCountry[index].id)
        }
    }
    
    @IBAction func selectStateAction(_ sender: Any) {
        self.configureColorDropdown(with: self.stateContainerView, and: arrayOfstate, decreaseWidth: false)
        self.dropdown.show()
        self.dropdown.selectionAction = { (index: Int, name: String) in
            self.stateTextField.text = self.arrayOfstate[index].name
            self.viewModel.stateId = self.arrayOfCountry[index].id
            self.getCollegeList(id: self.arrayOfCountry[index].id)
        }
    }
    
    @IBAction func selectCollegeAction(_ sender: Any) {
        self.configureColorDropdown(with: self.collegecontainerView, and: arrayOfCollege, decreaseWidth: false)
        self.dropdown.show()
        self.dropdown.selectionAction = { (index: Int, name: String) in
            self.viewModel.schoolId = self.arrayOfCollege[index].id
            self.collegeTextField.text = self.arrayOfCollege[index].name
        }
    }
    
    @IBAction func skipButton(_ sender: Any) {
        let storyBoard = UIStoryboard(name: StoryboardName.AtheleteRegisterStoryboard, bundle: nil)
        let nextVC = storyBoard.instantiateViewController(withIdentifier: "AthleteRegisterFiveViewController") as! AthleteRegisterFiveViewController
        self.navigationController?.pushViewController(nextVC, animated: false)
    }
    
    @IBAction func continueButtonAction(_ sender: Any) {
        viewModel.pinCode = pinCodeTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let result = viewModel.validation()
        if let message = result {
            self.showToast(message: message, errorType: .error)
        } else {
            updateAthleteDetail()
        }
    }
}

//MARK: - API Calling
extension AthleteRegisterFourViewController {
    
    func getCountryList() {
        self.viewModel.getCountryList(with: { data, error in
            if let data = data {
                self.arrayOfCountry = data.data
            }
            
            if let error = error {
                self.showToast(message: error, errorType: .error)
            }
        })
    }
    
    func getStateList(id:Int) {
        self.viewModel.getStateList(with: id, completionHandler: { data, error in
            if let data = data {
                self.arrayOfstate = data.data
            }
            
            if let error = error {
                self.showToast(message: error, errorType: .error)
            }
        })
    }
    
    func getCollegeList(id:Int) {
        self.viewModel.getCollegeList(with: id, completionHandler: { data, error in
            if let data = data {
                self.arrayOfCollege = data.data
            }
        
            if let error = error {
                self.showToast(message: error, errorType: .error)
            }
        })
    }
    
    func updateAthleteDetail() {
        self.viewModel.updateAthleteDetail(with: self.viewModel.param() as [String : Any], completionHandler: { data, error in
            if let data = data {
                if let status = data.status {
                    if status == 1 {
                        if let message = data.message {
                            self.showToast(message: message, errorType: .success)
                            let storyBoard = UIStoryboard(name: StoryboardName.AtheleteRegisterStoryboard, bundle: nil)
                            let nextVC = storyBoard.instantiateViewController(withIdentifier: "AthleteRegisterFiveViewController") as! AthleteRegisterFiveViewController
                            self.navigationController?.pushViewController(nextVC, animated: false)
                        }
                    } else {
                        if let message = data.message {
                            self.showToast(message: message, errorType: .error)
                        }
                    }
                }
            } else {
                if let error = error {
                    print(error)
                    self.showToast(message: error, errorType: .error)
                }
            }
        })
    }
}

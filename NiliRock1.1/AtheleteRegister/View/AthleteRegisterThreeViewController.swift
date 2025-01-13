//
//  AthleteRegisterThreeViewController.swift
//  NiliRock1.1
//
//  Created by Vijay's Braintech on 30/01/24.
//

import UIKit

class AthleteRegisterThreeViewController: UIViewController {
    
    //MARK: - OUTLETS
    @IBOutlet var mainContainer: UIView!
    @IBOutlet var navigationBar: CustomNavigationBar!
    @IBOutlet var container: UIView!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var tiltleLabel: BoldLabelSize4!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var skipButton: CustomButton!
    @IBOutlet var continueButton: CustomButton!
    
    //MARK: - PROPERTIES
    var viewModel = AthleteRegisterThreeViewModel()
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureNavigation()
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
        mainContainer.backgroundColor = UIColor.lightBlackColor
        container.backgroundColor = UIColor.blackColor
        container.layer.cornerRadius = Radius.radius2
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
        skipButton.setTitle("Skip", for: .normal)
        continueButton.setTitle("Continue", for: .normal)
        progressBar.progress = 0.5
        datePicker.addTarget(self, action: #selector(self.datePickerValueChanged(_:)), for: .valueChanged)
    }
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let date = formatter.string(from: datePicker.date)
        print(date)
        viewModel.userDOB = date
        self.view.endEditing(true)
    }
    
    @IBAction func skipAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: StoryboardName.AtheleteRegisterStoryboard, bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: "AthleteRegisterFourViewController") as! AthleteRegisterFourViewController
        self.navigationController?.pushViewController(nextVC, animated: false)
    }
    
    @IBAction func continueAction(_ sender: Any) {
        if let result = self.viewModel.validations() {
            self.showToast(message: result, errorType: .error)
        } else {
            updateAthleteDetail()
            //            let storyBoard = UIStoryboard(name: StoryboardName.AtheleteRegisterStoryboard, bundle: nil)
            //            let nextVC = storyBoard.instantiateViewController(withIdentifier: "AthleteRegisterFourViewController") as! AthleteRegisterFourViewController
            //            self.navigationController?.pushViewController(nextVC, animated: false)
        }
    }
}

//MARK: - ViewModel Intrection
extension AthleteRegisterThreeViewController {
    func updateAthleteDetail() {
        self.viewModel.updateAthleteDetail(with: self.viewModel.param() as [String : Any], completionHandler: { data, error in
            if let data = data {
                if let status = data.status {
                    if status == 1 {
                        if let message = data.message {
                            self.showToast(message: message, errorType: .success)
                            let storyBoard = UIStoryboard(name: StoryboardName.AtheleteRegisterStoryboard, bundle: nil)
                            let nextVC = storyBoard.instantiateViewController(withIdentifier: "AthleteRegisterFourViewController") as! AthleteRegisterFourViewController
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
                    self.showToast(message: error, errorType: .error)
                }
            }
        })
    }
}


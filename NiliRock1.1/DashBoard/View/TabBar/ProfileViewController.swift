//
//  ProfileViewController.swift
//  NiliRock1.1
//
//  Created by Vijay's Braintech on 06/02/24.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //MARK: - OUTLETS
    @IBOutlet var mainContainerView: UIView!
    @IBOutlet var navigationBar: CustomNavigationBar!
    @IBOutlet var tableContainerView: UIView!
    @IBOutlet var tableView: UITableView!
    
    //MARK: - Properties
    var arrayOfMenuItem = ["Update Profile Information","Update Sports","Update Industries","Update Activities Of Interest","Update Price Range","Update Social Media Url","Support","About Us","Privacy Policy","Delete Your Account","Account Verification","Add Bank Account"]
    var viewModel = ProfileViewModel()
    var profileData:ProfileData?
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        confiqureUI()
        configureNavigation()
        registerCell()
        getProfileData()
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
        tableContainerView.backgroundColor = UIColor.blackColor
        tableContainerView.layer.cornerRadius = Radius.radius1
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func registerCell() {
        tableView.register(UINib(nibName: "ProfileTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileTableViewCell")
        tableView.register(UINib(nibName: "LogoutTableViewCell", bundle: nil), forCellReuseIdentifier: "LogoutTableViewCell")
        tableView.register(UINib(nibName: "UserDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "UserDetailTableViewCell")
    }
}

//MARK: - UITableViewDataSource, UITableViewDelegate
extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfMenuItem.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell") as! ProfileTableViewCell
            if let data = profileData {
                cell.confiqureData(data: data)
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserDetailTableViewCell") as! UserDetailTableViewCell
            cell.confiqureData(data: arrayOfMenuItem[indexPath.row-1])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LogoutTableViewCell") as! LogoutTableViewCell
        cell.logoutAction = {
            Constants.clearUserDefaults()
            let storyBoard = UIStoryboard(name: StoryboardName.dashboardStoryboard, bundle: nil)
            let nextVC = storyBoard.instantiateViewController(identifier: "LoginViewController") as! LoginViewController
            self.navigationController?.pushViewController(nextVC,animated: false)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 66.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            let storyBoard = UIStoryboard(name: StoryboardName.AtheleteRegisterStoryboard, bundle: nil)
            let nextVc = storyBoard.instantiateViewController(withIdentifier: "AtheleteRegisterOneViewController") as! AtheleteRegisterOneViewController
            self.navigationController?.pushViewController(nextVc, animated: false)
        } else if indexPath.row == 2 {
            let storyBoard = UIStoryboard(name: StoryboardName.AtheleteRegisterStoryboard, bundle: nil)
            let nextVc = storyBoard.instantiateViewController(withIdentifier: "AthleteRegisterFiveViewController") as! AthleteRegisterFiveViewController
            nextVc.isRegister = .update
            self.navigationController?.pushViewController(nextVc, animated: false)
        } else if indexPath.row == 3 {
            let storyBoard = UIStoryboard(name: StoryboardName.AtheleteRegisterStoryboard, bundle: nil)
            let nextVc = storyBoard.instantiateViewController(withIdentifier: "AthleteRegisterSixViewController") as! AthleteRegisterSixViewController
            nextVc.isRegister = .update
            self.navigationController?.pushViewController(nextVc, animated: false)
        } else if indexPath.row == 4 {
            let storyBoard = UIStoryboard(name: StoryboardName.AtheleteRegisterStoryboard, bundle: nil)
            let nextVc = storyBoard.instantiateViewController(withIdentifier: "AthleteRegisterSevenViewController") as! AthleteRegisterSevenViewController
            self.navigationController?.pushViewController(nextVc, animated: false)
        } else if indexPath.row == 5 {
            let storyBoard = UIStoryboard(name: StoryboardName.AtheleteRegisterStoryboard, bundle: nil)
            let nextVc = storyBoard.instantiateViewController(withIdentifier: "AthleteRegisterEightViewController") as! AthleteRegisterEightViewController
            self.navigationController?.pushViewController(nextVc, animated: false)
        }
    }
}

//MARK: - ViewModel Interaction
extension ProfileViewController {
    func getProfileData() {
        viewModel.userDetail(with: { data, error in
            if let data = data {
                if data.status == 1 {
                    self.profileData = data.data
                    self.tableView.reloadData()
                }
            }
        })
    }
}

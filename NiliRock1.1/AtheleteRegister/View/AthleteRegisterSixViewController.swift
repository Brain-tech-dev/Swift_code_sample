//
//  AthleteRegisterSixViewController.swift
//  NiliRock1.1
//
//  Created by Vijay's Braintech on 05/02/24.
//

import UIKit

class AthleteRegisterSixViewController: UIViewController {
    
    //MARK: - OUTLETS
    @IBOutlet var navigationBar: CustomNavigationBar!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var container: UIView!
    @IBOutlet var MainContainer: UIView!
    @IBOutlet var pageTitlelabel: BoldLabelSize4!
    @IBOutlet var checkUncheckImageview: UIImageView!
    @IBOutlet var selectAllLabel: CustomRegularLabel!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var skipButton: CustomButton!
    @IBOutlet var continueButton: CustomButton!
    
    //MARK: - PROPERTIES
    var viewModel  = AthleteRegisterSixViewModel()
    var arrayOfSport: [SportData] = [SportData]()
    var isSelected = false
    var isRegister: RegisterType = .register

    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        registerCell()
        configureNavigation()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        getIndustryListModel()
       
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
    
    func registerCell() {
        collectionView.register(UINib(nibName: "SportCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SportCollectionViewCell")
    }
    
    func configureUI() {
        MainContainer.backgroundColor = .lightBlackColor
        container.backgroundColor = UIColor.blackColor
        container.layer.cornerRadius = Radius.radius1
        skipButton.setTitle("Skip", for: .normal)
        if isRegister == .update {
            continueButton.setTitle("Update", for: .normal)
            skipButton.isHidden = true
        } else {
            continueButton.setTitle("Continue", for: .normal)
        }
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    //select all button action
    private func configureSelectAllActivity() {
        for data in self.arrayOfSport {
            if data.selected != 1 {
                checkUncheckImageview.image = Icons.uncheckBlue
                self.isSelected = false
                break
            } else {
                checkUncheckImageview.image = Icons.checkBlue
                self.isSelected = true
                
            }
        }
        collectionView.reloadData()
    }
    
    // select all cell
    func confiqureAllSelection() {
        if isSelected {
            checkUncheckImageview.image = Icons.checkBlue
            for i in 0..<arrayOfSport.count {
                self.arrayOfSport[i].selected = 1
            }
        } else {
            checkUncheckImageview.image = Icons.uncheckBlue
            for i in 0..<arrayOfSport.count {
                self.arrayOfSport[i].selected = 0
            }
        }
        collectionView.reloadData()
    }
    
    @IBAction func isSelectedAllAction(_ sender: Any) {
        isSelected = !isSelected
        confiqureAllSelection()
    }
    
    @IBAction func skipAction(_ sender: Any) {
        let storyBoard = UIStoryboard(name: StoryboardName.AtheleteRegisterStoryboard, bundle: nil)
        let nextVC = storyBoard.instantiateViewController(withIdentifier: "AthleteRegisterSevenViewController") as! AthleteRegisterSevenViewController
        self.navigationController?.pushViewController(nextVC, animated: false)
    }
    
    @IBAction func SaveSportAction(_ sender: Any) {
        var selectCategoryId : [Int] = []
        for i in arrayOfSport {
            if i.selected == 1 {
                if let id  = i.id {
                    selectCategoryId.append(id)
                }
            }
        }
        self.viewModel.athleteIndustrySelectedId = selectCategoryId
        if let res = viewModel.validations() {
            self.showToast(message: res, errorType: .error)
        } else {
            updateAthleteDetail()
        }
    }
}

//MARK: - UICollectionViewDelegate
extension AthleteRegisterSixViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfSport.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SportCollectionViewCell", for: indexPath) as! SportCollectionViewCell
        cell.configureSportsData(data: arrayOfSport[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding = 8
        let width = (collectionView.frame.size.width - CGFloat(padding) * 2) / CGFloat(2)
        return CGSize(width: width, height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if self.arrayOfSport[indexPath.row].selected == 1 {
            self.arrayOfSport[indexPath.row].selected = 0
            configureSelectAllActivity()
        } else {
            self.arrayOfSport[indexPath.row].selected = 1
            configureSelectAllActivity()
        }
    }
}

//MARK: - Api Calling
extension AthleteRegisterSixViewController {
    
    func getIndustryListModel() {
        self.viewModel.getIndustryList(with: { data, error in
            if let data = data {
                if let status = data.status {
                    if status == 1 {
                        if let sportData = data.data {
                            self.arrayOfSport = sportData
                            self.collectionView.reloadData()
                        }
                    }
                }
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
                            if self.isRegister == .update {
                                self.navigationController?.popViewController(animated: false)
                            } else {
                                let storyBoard = UIStoryboard(name: StoryboardName.AtheleteRegisterStoryboard, bundle: nil)
                                let nextVC = storyBoard.instantiateViewController(withIdentifier: "AthleteRegisterSevenViewController") as! AthleteRegisterSevenViewController
                                self.navigationController?.pushViewController(nextVC, animated: false)
                            }
                        }
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

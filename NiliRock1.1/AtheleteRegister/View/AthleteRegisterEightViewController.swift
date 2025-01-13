//
//  AthleteRegisterEightViewController.swift
//  NiliRock1.1
//
//  Created by Vijay's Braintech on 05/02/24.
//

import UIKit

class AthleteRegisterEightViewController: UIViewController {
    
    //MARK: - OUTLETS
    @IBOutlet var navigationBar: CustomNavigationBar!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var container: UIView!
    @IBOutlet var MainContainer: UIView!
    @IBOutlet var pageTitlelabel: BoldLabelSize4!
    @IBOutlet var checkUncheckImageview: UIImageView!
    @IBOutlet var selectAllLabel: CustomRegularLabel!
    @IBOutlet var skipButton: CustomButton!
    @IBOutlet var continueButton: CustomButton!
    @IBOutlet var tableView: UITableView!
    
    //MARK: - PROPERTIES
    var viewModel = AthleteRegisterEightViewModel()
    var arrayOfPrice = [PriceRangeData]()
    var isSelected = false
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureNavigation()
        registerCell()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getPriceList()
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
        tableView.register(UINib(nibName: "PriceTableViewCell", bundle: nil), forCellReuseIdentifier: "PriceTableViewCell")
    }
    
    func configureUI() {
        MainContainer.backgroundColor = .lightBlackColor
        container.backgroundColor = UIColor.blackColor
        container.layer.cornerRadius = Radius.radius1
        skipButton.setTitle("Skip", for: .normal)
        continueButton.setTitle("Continue", for: .normal)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func confiqureAllSelection() {
        if isSelected {
            checkUncheckImageview.image = Icons.checkBlue
            for i in 0..<arrayOfPrice.count {
                self.arrayOfPrice[i].selected = 1
            }
        } else {
            checkUncheckImageview.image = Icons.uncheckBlue
            for i in 0..<arrayOfPrice.count {
                self.arrayOfPrice[i].selected = 0
            }
        }
        tableView.reloadData()
    }
    
    //select all button action
    private func configureSelectAllActivity() {
        for data in self.arrayOfPrice {
            if data.selected != 1 {
                checkUncheckImageview.image = Icons.uncheckBlue
                self.isSelected = false
                break
            } else {
                checkUncheckImageview.image = Icons.checkBlue
                self.isSelected = true
            }
        }
        tableView.reloadData()
    }
    
    @IBAction func isSelectedAllAction(_ sender: Any) {
        isSelected = !isSelected
        confiqureAllSelection()
    }
    
    @IBAction func skipAction(_ sender: Any) {
        let storyBoard = UIStoryboard(name: StoryboardName.dashboardStoryboard, bundle: nil)
        let nextVc = storyBoard.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
        self.navigationController?.pushViewController(nextVc, animated: false)
    }
    
    @IBAction func SaveSportAction(_ sender: Any) {
        let selectedCategory  = arrayOfPrice.filter{ $0.selected == 1 }
        var selectPriceId : [Int] = []
        for i in 0..<selectedCategory.count {
            if let id  = selectedCategory[i].id {
                selectPriceId.append(id)
            }
        }
        self.viewModel.payRangeIds = selectPriceId
        if let res = viewModel.validations() {
            self.showToast(message: res, errorType: .error)
        } else {
            updateAthleteDetail()
        }
        
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension AthleteRegisterEightViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfPrice.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PriceTableViewCell", for: indexPath) as! PriceTableViewCell
        cell.confiqureData(data: self.arrayOfPrice[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.arrayOfPrice[indexPath.row].selected == 1 {
            self.arrayOfPrice[indexPath.row].selected = 0
            configureSelectAllActivity()
        } else {
            self.arrayOfPrice[indexPath.row].selected = 1
            configureSelectAllActivity()
        }
    }
}

//MARK: - Api Calling
extension AthleteRegisterEightViewController {
    func getPriceList() {
        self.viewModel.getPriceRange(with: { data, error in
            if let data = data {
                if let status = data.status {
                    if status == 1 {
                        if let arrayOfPrice = data.data {
                            self.arrayOfPrice = arrayOfPrice
                            self.tableView.reloadData()
                        }
                    }
                }
            }
        })
    }
    
    func updateAthleteDetail() {
        self.viewModel.updateAthleteDetail(with: self.viewModel.param() as [String : Any]) { data, error in
            if let data = data {
                if let status = data.status {
                    if status == 1 {
                        if let message = data.message {
                            self.showToast(message: message, errorType: .success)
                            let storyBoard = UIStoryboard(name: StoryboardName.dashboardStoryboard, bundle: nil)
                            let nextVc = storyBoard.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
                            self.navigationController?.pushViewController(nextVc, animated: false)
                        }
                        
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
        }
    }
}

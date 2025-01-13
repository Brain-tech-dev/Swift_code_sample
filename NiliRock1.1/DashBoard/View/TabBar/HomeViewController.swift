//
//  HomeViewController.swift
//  NiliRock1.1
//
//  Created by Vijay's Braintech on 06/02/24.
//

import UIKit

class HomeViewController: UIViewController {

    //MARK: - OUTLETS
    @IBOutlet var mainContainerView: UIView!
    @IBOutlet var navigationBar: CustomNavigationBar!
    @IBOutlet var collectionContainerView: UIView!
    @IBOutlet var collectionView: UICollectionView!
    
    //MARK: - PROPERTIES
    var viewModel = HomeViewModel()
    var dashBoardData: DashBoardData?
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        confiqureUI()
        configureNavigation()
        registerCell()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getDashBoardList()
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
        collectionContainerView.backgroundColor = UIColor.blackColor
        collectionContainerView.layer.cornerRadius = Radius.radius1
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func registerCell() {
        collectionView.register(UINib(nibName: "HomeFirstCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeFirstCollectionViewCell")
    }

}

//MARK: - UICollectionViewDataSource,UICollectionViewDelegate
extension HomeViewController: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeFirstCollectionViewCell", for: indexPath) as! HomeFirstCollectionViewCell
        cell.confiqureData(data: dashBoardData, type: dashBoardData?.role, index: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            let width = collectionView.frame.size.width
            return CGSize(width: width, height: 160)
        } else {
            let padding = 8
            let width = (collectionView.frame.size.width - CGFloat(padding) * 2) / CGFloat(2)
            return CGSize(width: width, height: 160)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}
//MARK: - API Calling
extension HomeViewController {
    
    func getDashBoardList() {
        viewModel.getDashBoardList(with: true, completionHandler: {data, error in
            if let data = data {
                if let status = data.status {
                    if status == 1 {
                        if let dashBoardData = data.data {
                            print(dashBoardData)
                            self.dashBoardData = dashBoardData
                            self.collectionView.reloadData()
                        }
                    }
                }
            }
        })
    }
    
    
}

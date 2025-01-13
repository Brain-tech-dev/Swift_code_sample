//
//  HomeFirstCollectionViewCell.swift
//  NiliRock1.1
//
//  Created by Sazid Saifi on 07/02/24.
//

import UIKit

class HomeFirstCollectionViewCell: UICollectionViewCell {

    //MARK: ->Outlet
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: CustomRegularLabel!
    @IBOutlet weak var priceLabel: CustomRegularLabelYellow!
    
    
    //MARK: ->LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        confiqureUI()
    }
    
    func confiqureUI() {
        containerView.backgroundColor = .lightBlackColor1
        containerView.layer.cornerRadius = Radius.radius1
    }
    
    func confiqureData(data: DashBoardData?, type: String?, index: Int) {
        print(index)
        if let data = data {
            if index == 0 {
                titleLabel.text = "Total Earning"
                if let price = data.totalEarning {
                    priceLabel.text = "$\(price)"
                } else {
                    priceLabel.text = "$0"
                }
            }
            if index == 1 {
                titleLabel.text = "Accepted Requests"
                if let count = data.acceptedRequestsCount {
                    priceLabel.text = "\(count)"
                } else {
                    priceLabel.text = "0"
                }
            }
            
            if index == 2 {
                titleLabel.text = "Endorsement Request "
                if let count = data.totalEndorsmentsAwarded{
                    priceLabel.text = "\(count)"
                } else {
                    priceLabel.text = "0"
                }
            }
            
            if index == 3 {
                titleLabel.text = "Endorsement Message "
                if let count = data.unreadMessagesCount{
                    priceLabel.text = "\(count)"
                } else {
                    priceLabel.text = "0"
                }
            }
            
            if index == 4 {
                titleLabel.text = "Payout Request "
                if let count = data.completedPayoutCount{
                    priceLabel.text = "\(count)"
                } else {
                    priceLabel.text = "0"
                }
            }
            
            if index == 5 {
                titleLabel.text = "Profile View Count"
                if let count = data.profileViewCount{
                    priceLabel.text = "\(count)"
                } else {
                    priceLabel.text = "0"
                }
            }
        }
    }

}

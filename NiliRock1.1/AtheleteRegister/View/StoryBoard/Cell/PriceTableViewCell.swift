//
//  PriceTableViewCell.swift
//  NiliRock1.1
//
//  Created by Vijay's Braintech on 05/02/24.
//

import UIKit

class PriceTableViewCell: UITableViewCell {

    //MARK: - OUTLETS
    
    @IBOutlet var MainContainerView: UIView!
    @IBOutlet var containerView: UIView!
    @IBOutlet var checkImageView: UIImageView!
    @IBOutlet var priceLabel: SemiBoldLabelSize16!
    
    //MARK: - LIFECYCLE
    override func awakeFromNib() {
        super.awakeFromNib()
        confiqureUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func confiqureUI() {
        containerView.backgroundColor = UIColor.lightBlackColor1
        containerView.layer.cornerRadius = Radius.radius1
        checkImageView.image = Icons.uncheckBlue
        checkImageView.tintColor = UIColor.yellowGradientOne
    }
    
    func confiqureData(data: PriceRangeData) {
        priceLabel.text = data.payRange
        
        if data.selected == 1 {
            containerView.layer.borderColor = UIColor.yellowGradientOne.cgColor
            containerView.layer.borderWidth = 1.0
            checkImageView.image = Icons.checkBlue
            checkImageView.tintColor = UIColor.yellowGradientOne
            
        } else {
            containerView.layer.borderColor = UIColor.lightBlackColor1.cgColor
            containerView.layer.borderWidth = 1.0
            checkImageView.image = Icons.uncheckBlue
        }
    }
}

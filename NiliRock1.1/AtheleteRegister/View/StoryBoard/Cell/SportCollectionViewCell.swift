//
//  SportCollectionViewCell.swift
//  NiliRock1.1
//
//  Created by Vijay's Braintech on 02/02/24.
//

import UIKit
import SDWebImage

class SportCollectionViewCell: UICollectionViewCell {
  
    //MARK: - OUTLETS
    
    @IBOutlet var containerView: UIView!
    @IBOutlet var sportImageView: UIImageView!
    @IBOutlet var sportNameLabel: SemiBoldLabelSize16!
    
    //MARK: - PROPERTIES
    private lazy var gradient: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.blueGradientOne.cgColor, UIColor.blueGradientTwo.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = self.bounds
        return gradientLayer
    }()
    
    //MARK: - LIFECYCLE
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
        
    }
    
    //MARK: - HELPERS
    func configureUI() {
        containerView.backgroundColor = UIColor.lightBlackColor1
        containerView.layer.cornerRadius = Radius.radius1
        sportImageView.layer.cornerRadius = sportImageView.frame.width/2
        containerView.clipsToBounds = true
    }
    
    func configureData(data: SportData) {
        sportNameLabel.text = data.name
        if let imageURL = data.image {
            sportImageView.sd_setImage(with: URL(string: imageURL))
        }
        if data.selected == 1 {
            containerView.layer.insertSublayer(self.gradient, at: 0)
        } else {
            self.gradient.removeFromSuperlayer()
            containerView.backgroundColor = UIColor.lightBlackColor1
        }
    }
    
    
    func configureSportsData(data: SportData) {
        sportNameLabel.text = data.name
        if let imageURL = data.image {
            sportImageView.sd_setImage(with: URL(string: imageURL))
        }
        if data.selected == 1 {
            containerView.layer.insertSublayer(self.gradient, at: 0)
        } else {
            self.gradient.removeFromSuperlayer()
            containerView.backgroundColor = UIColor.lightBlackColor1
        }
    }

}

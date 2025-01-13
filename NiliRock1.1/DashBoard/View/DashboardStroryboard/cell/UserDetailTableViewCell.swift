//
//  UserDetailTableViewCell.swift
//  NiliRock1.1
//
//  Created by Sazid Saifi on 07/02/24.
//

import UIKit

class UserDetailTableViewCell: UITableViewCell {
    
   
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var editImageView: UIImageView!
    @IBOutlet weak var titleLabel: CustomRegularLabel1!
    
    
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
        editImageView.tintColor = .white
    }
    
    func confiqureData(data: String) {
        titleLabel.text = data
    }
    
}

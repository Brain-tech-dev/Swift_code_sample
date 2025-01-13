//
//  ProfileTableViewCell.swift
//  NiliRock1.1
//
//  Created by Sazid Saifi on 07/02/24.
//

import UIKit
import SDWebImage

class ProfileTableViewCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var pageTitle: SemiBoldLabelSize18!
    @IBOutlet weak var userName: SemiBoldLabelSize16!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        confiqureUI()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .none
    }
    
    func confiqureUI() {
        profileImage.layer.cornerRadius = profileImage.frame.width/2
    }
    
    func confiqureData(data: ProfileData) {
        profileImage.sd_setImage(with: URL(string: data.user.image))
        userName.text = data.user.firstname.capitalized+" "+data.user.lastname.capitalized
    }
}

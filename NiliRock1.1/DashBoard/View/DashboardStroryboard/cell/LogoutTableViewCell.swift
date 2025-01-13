//
//  LogoutTableViewCell.swift
//  NiliRock1.1
//
//  Created by Sazid Saifi on 07/02/24.
//

import UIKit

class LogoutTableViewCell: UITableViewCell {

    @IBOutlet weak var logoutButton: CustomButton!
    var logoutAction: (()-> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        confiqureUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func confiqureUI() {
        logoutButton.setTitle("Logout", for: .normal)
    }
    
    @IBAction func logoutAction(_ sender: Any) {
        logoutAction?()
    }
}

//
//  customEnums.swift
//  NiliRock1.1
//
//  Created by Vijay's Braintech on 30/01/24.
//

import Foundation


enum Gender: String {
    case male = "Male"
    case female = "Female"
}

enum ToastType {
    case success
    case error
    case warning
    case info
}

enum UserType: String {
    case athlete = "Athlete"
    case company = "Company"
    case endorsement = "Endorsement"
    case none = "none"
}

enum AthleteSeven: String {
    case payRangeIds = "pay_range_ids"
}

enum RegisterType {
    case register, update, endorsement
}

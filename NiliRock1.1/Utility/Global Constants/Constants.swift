//
//  Constants.swift
//  NiliRock1.1
//
//  Created by Vijay's Braintech on 30/01/24.
//

import Foundation


struct Constants {
    
    static let baseUrl  = "https://laravelproject.onlineprojectprogress.com/nilirock/api/"
    //MARK: - Urls
    struct Urls {
        static let login = "login"
        //Athlete Register
        static let athleteRegister = "athlete/registerAccount"
        static let uploadDOB = "athletes/updateDetail"
        static let getStateList = "states-list"
        static let getCityList = "cities-list-by-state-id/"
        static let getSchoolList = "schools-list-by-state-id/"
        static let athletesSportsList = "athletes/sports-list"
        static let uploadSports = "athletes/updateSports"
        static let athletesIndustryList = "athletes/industries-list"
        static let uploadIndustry = "athletes/updateIndustries"
        static let athletesActivityUpdate = "athletes/updateActivities"
        static let athletesActivityList = "athletes/activities-list"
        static let athletesPriceRangeList = "athletes/pay-ranges-list"
        static let updatePayRange = "athletes/updatePayRanges"
        static let dashboardList = "dashboard"
        static let userDetail = "users/detail"

    }
    
    struct Keys {
        static let image = "image"
        static let userId = "userId"
        static let accessToken = "accessToken"
        static let deviceId = "deviceId"
        static let deviceToken = "deviceToken"
        static let firstName = "firstName"
        static let lastName = "lastName"
        static let imageUrl = "image_url"
        static let email = "email"
        static let phone = "phone"
        static let loginType = "loginType"
        static let facebookToken = "facebookAccessToken"
        static let googleToken = "googleAccessToken"
        static let companyName = "companyName"
        static let contactPerson = "contactPerson"
        static let gender = "gender"
        static let endorsementType = "endorsementType"
        static let userType = "userType"
        static let checkMember = "checkMember"
        static let accountVerification = "accountVerification"
    }
    
    //Email-Validation
    static func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    static func getDeviceId() -> String {
        guard let deviceId = UserDefaults.standard.object(forKey: Keys.deviceId) as? String else { return "" }
        return deviceId
    }
    
    //deviceToken
    static func getDeviceToken() -> String {
        return UserDefaults.standard.string(forKey: Keys.deviceToken) ?? ""
    }
    
    static func clearUserDefaults() {
        UserDefaults.standard.removeObject(forKey: Constants.Keys.accessToken)
    }
}



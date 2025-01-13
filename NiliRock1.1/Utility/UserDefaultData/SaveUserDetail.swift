//
//  SaveUserDetail.swift
//  NiliRock1.1
//
//  Created by Vijay's Braintech on 31/01/24.
//

import Foundation


struct SaveUserDetails {
    
    //Save AthleteRegister Details
    static func saveRegisterDetails(with data: AtheleteRegisterOneModel?) {
        if let accessToken = data?.data?.accessToken {
            UserDefaults.standard.setValue(accessToken, forKey: Constants.Keys.accessToken)
        }
        
        if let firstname = data?.data?.user?.firstname {
            UserDefaults.standard.setValue(firstname, forKey: Constants.Keys.firstName)
        }
        
        if let email = data?.data?.user?.email {
            UserDefaults.standard.setValue(email, forKey: Constants.Keys.email)
        }
        if let companyName = data?.data?.user?.companyName {
            UserDefaults.standard.setValue(companyName, forKey: Constants.Keys.companyName)
        }
        
        if let contactPerson = data?.data?.user?.contactPerson {
            UserDefaults.standard.setValue(contactPerson, forKey: Constants.Keys.contactPerson)
        }
        if let lastname = data?.data?.user?.lastname {
            UserDefaults.standard.setValue(lastname, forKey: Constants.Keys.lastName)
        }
        
        if let id = data?.data?.user?.id {
            UserDefaults.standard.setValue(id, forKey: Constants.Keys.userId)
        }
        if let id = data?.data?.user?.image {
            UserDefaults.standard.setValue(id, forKey: Constants.Keys.image)
        }
        
        if let data = data {
            if let user = data.data?.user {
                if let userType = user.role {
                    if userType == UserType.athlete.rawValue {
                        UserDefaults.standard.setValue(userType, forKey: Constants.Keys.loginType)
                    } else {
                        UserDefaults.standard.setValue(userType, forKey: Constants.Keys.loginType)
                    }
                }
                if let genderType = user.gender {
                    if genderType == Gender.male.rawValue {
                        UserDefaults.standard.setValue(genderType, forKey: Constants.Keys.gender)
                    } else {
                        UserDefaults.standard.setValue(genderType, forKey: Constants.Keys.gender)
                    }
                }

            }
        }
        
        if let accountVerification = data?.data?.user?.account_verification {
            UserDefaults.standard.setValue(accountVerification, forKey: Constants.Keys.accountVerification)
        }
    }
    
    //Save Login Details
    static func saveUserDetails(with data: UserData?) {
        if let accessToken = data?.accessToken {
            UserDefaults.standard.setValue(accessToken, forKey: Constants.Keys.accessToken)
            print("access Token",accessToken)
        }
        
        if let firstname = data?.user?.firstname {
            UserDefaults.standard.setValue(firstname, forKey: Constants.Keys.firstName)
        }
        
        if let email = data?.user?.email {
            UserDefaults.standard.setValue(email, forKey: Constants.Keys.email)
        }
        
        if let companyName = data?.user?.companyName {
            UserDefaults.standard.setValue(companyName, forKey: Constants.Keys.companyName)
        }
        
        if let contactPerson = data?.user?.contactPerson {
            UserDefaults.standard.setValue(contactPerson, forKey: Constants.Keys.contactPerson)
        }
        
        if let email = data?.user?.image {
            UserDefaults.standard.setValue(email, forKey: Constants.Keys.image)
        }
        
        if let lastname = data?.user?.lastname {
            UserDefaults.standard.setValue(lastname, forKey: Constants.Keys.lastName)
        }
        
        if let id = data?.user?.id {
            UserDefaults.standard.setValue(id, forKey: Constants.Keys.userId)
        }
        
        if let data = data {
            if let user = data.user {
                if let userType = user.role {
                    if userType == UserType.athlete.rawValue {
                        UserDefaults.standard.setValue(userType, forKey: Constants.Keys.loginType)
                    } else {
                        UserDefaults.standard.setValue(userType, forKey: Constants.Keys.loginType)
                    }
                }
                if let genderType = user.gender {
                    if genderType == Gender.male.rawValue {
                        UserDefaults.standard.setValue(genderType, forKey: Constants.Keys.gender)
                    } else {
                        UserDefaults.standard.setValue(genderType, forKey: Constants.Keys.gender)
                    }
                }
            }
        }
        
        if let accountVerification = data?.user?.account_verification {
            UserDefaults.standard.setValue(accountVerification, forKey: Constants.Keys.accountVerification)
        }
    }
}

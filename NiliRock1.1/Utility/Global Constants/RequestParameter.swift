//
//  RequestParameter.swift
//  NiliRock1.1
//
//  Created by Vijay's Braintech on 30/01/24.
//

import Foundation


//MARK: - Login Param
enum Login: String {
    case email = "email"
    case password = "password"
    case deviceId = "device_id"
    case deviceToken = "device_token"
    case deviceType = "device_type"
}

//MARK: - Athelete Register Param
enum AthleteOneParam: String {
    case firstname = "firstname"
    case lastname = "lastname"
    case email = "email"
    case password = "password"
    case passwordConfirmation = "password_confirmation"
    case gender = "gender"
    case phone = "phone"
    case deviceId = "device_id"
    case deviceToken = "device_token"
    case deviceType = "device_type"
}

//MARK: - Athlete register Three Param
enum AthleteThreeParam: String {
    case dob = "dob"
}

//MARK: - Athlete register four Param
enum AthleteFourParam: String {
    case schoolId = "school_id"
    case stateId = "state_id"
    case cityId = "city_id"
    case pinCode = "pin_code"
}

//MARK: - Athlete register five Param
enum AthleteFive: String {
    case athleteCategoryId = "athlete_category_ids"
}

enum AthleteSix: String {
    case athleteIndustryId = "industry_ids"
}

enum AthleteActivity: String {
    case activityId = "activity_ids"
}

enum AthleteNine: String {
    case facebook = "facebook"
    case twitter = "twitter"
    case instagram = "instagram"
    case tikTok = "tikTok"
}

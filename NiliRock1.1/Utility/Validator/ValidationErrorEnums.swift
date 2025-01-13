//
//  ValidationErrorEnums.swift
//  NiliRock1.1
//
//  Created by Vijay's Braintech on 30/01/24.
//

import Foundation


enum ValidationErrors: String {
    case emptyEmail = "Please enter email address"
    case emptyPassword = "Please enter password"
    case validEmail = "Please enter valid email address"
    case firstName = "Please enter first name"
    case emptyLastName = "Please enter last name"
    case passwordShouldNotMatch = "Password and Confirm password should be match"
    case emptyMobileNumber = "Please enter phone number"
    case emptyConfirmPassword = "Please enter confirm password"
    case emptydate = "Please select the date of birth"
    case emptyCountry = "Please select your Country"
    case emptyState = "Please select your state"
    case emptypinCode = "Please enter your pin code"
    case emptyCollege = "Please select your college"
    case emptyArraySport = "Please select your Sport"
    case emptyArrayIndustry = "Please select your Industry"
    case emptyArrayActivity = "Please select your Interseted Activity"
    case emptyPriceRange = "Please select your Price Range"
}

//
//  Validations.swift
//  NiliRock1.1
//
//  Created by Vijay's Braintech on 30/01/24.
//

import Foundation


class Validations: ValidationProtocol {
    
    static func isEmptyEmail(email: String?) -> ValidationErrors? {
        guard let email = email else { return ValidationErrors.emptyEmail }
        if email.count > 0 { return nil }
        return ValidationErrors.emptyEmail
    }
    
    static func isValidEmail(email: String?) -> ValidationErrors? {
        guard let email = email else { return ValidationErrors.validEmail }
        if (Constants.isValidEmail(email)) { return nil }
        return ValidationErrors.validEmail
    }
    
    
    static func isEmptyPassword(password: String?) -> ValidationErrors? {
        guard let password = password else { return ValidationErrors.emptyPassword }
        if password.count > 0 { return nil }
        return ValidationErrors.emptyPassword
    }
    
    static func isEmptyFirstName(firstName: String?) -> ValidationErrors? {
        guard let firstName = firstName else { return ValidationErrors.firstName }
        if firstName.count > 0 { return nil }
        return ValidationErrors.firstName
    }
    
    static func isEmptyLastName(lastName: String?) -> ValidationErrors? {
        guard let lastName = lastName else { return ValidationErrors.emptyLastName }
        if lastName.count > 0 { return nil }
        return ValidationErrors.emptyLastName
    }
    
    static func isPasswordAndConfirmPasswordMatch(password: String?, confirmPassword: String?) -> ValidationErrors? {
        guard let password = password,
              let confirmPassword = confirmPassword else { return ValidationErrors.passwordShouldNotMatch }
        if password == confirmPassword { return nil }
        return ValidationErrors.passwordShouldNotMatch
    }
    
    static func isEmptyMobileNumber(mobileNumber: String?) -> ValidationErrors? {
        guard let mobileNumber = mobileNumber else { return ValidationErrors.emptyMobileNumber }
        if mobileNumber.count > 0 { return nil }
        return ValidationErrors.emptyMobileNumber
    }
    
    static func isEmptyConfirmPassword(confirmPassword: String?) -> ValidationErrors? {
        guard let confirmPassword = confirmPassword else { return ValidationErrors.emptyConfirmPassword }
        if confirmPassword.count > 0 { return nil }
        return ValidationErrors.emptyConfirmPassword
    }
    
    static func isEmptyDate(date: String?) -> ValidationErrors? {
        guard let date = date else { return ValidationErrors.emptydate }
        if date.count > 0 { return nil }
        return ValidationErrors.emptydate
    }
    
    static func isEmptyCountryId(countryID: Int?) -> ValidationErrors? {
        guard let state = countryID else { return ValidationErrors.emptyCountry }
        if state > 0 { return nil }
        return ValidationErrors.emptyCountry
    }
    
    static func isEmptyStateId(state: Int?) -> ValidationErrors? {
        guard let state = state else { return ValidationErrors.emptyState }
        if state > 0 { return nil }
        return ValidationErrors.emptyState
    }
    
    static func isEmptyPinCode(pin: String?) -> ValidationErrors? {
        guard let pin = pin else { return ValidationErrors.emptypinCode }
        if pin.count > 0 { return nil }
        return ValidationErrors.emptypinCode
    }
    
    static func isEmptyCollegeId(collegeId: Int?) -> ValidationErrors? {
        guard let collegeId = collegeId else { return ValidationErrors.emptyCollege }
        if collegeId > 0 { return nil }
        return ValidationErrors.emptyCollege
    }
    
    static func isEmptySportId(arraySportID: [Int]?) -> ValidationErrors? {
        guard let collegeId = arraySportID else { return ValidationErrors.emptyArraySport }
        if collegeId.count > 0 { return nil }
        return ValidationErrors.emptyArraySport
    }
    
    static func isEmptyIndustryId(arrayIndustryID: [Int]?) -> ValidationErrors? {
        guard let industryId = arrayIndustryID else { return ValidationErrors.emptyArrayIndustry }
        if industryId.count > 0 { return nil }
        return ValidationErrors.emptyArrayIndustry
    }
    
    static func isEmptyActivityId(arrayActivityID: [Int]?) -> ValidationErrors? {
        guard let industryId = arrayActivityID else { return ValidationErrors.emptyArrayActivity }
        if industryId.count > 0 { return nil }
        return ValidationErrors.emptyArrayActivity
    }
    
    static func isEmptyPriceRange(priceRangeArray payRange: [Int]?) -> ValidationErrors? {
        guard let payRange = payRange else { return ValidationErrors.emptyPriceRange }
        if payRange.count > 0 { return nil }
        return ValidationErrors.emptyPriceRange
    }
}

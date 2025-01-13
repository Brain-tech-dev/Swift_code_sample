//
//  AthleteRegisterOneViewModel.swift
//  NiliRock1.1
//
//  Created by Vijay's Braintech on 30/01/24.
//

import Foundation


struct AthleteRegisterOneViewModel {
    
    //MARK: - Properties
    //for Register
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var phone: String = ""
    var password: String = ""
    var confirmPassword: String = ""
    //    var registerType: RegisterType = .register
    var isSelectedGender: Gender = .male
   // var gender:String = "male"
    var isAcceptedTerms: Bool = false
    
    //MARK: - Helpers
    func validations() -> String? {
        let firstNameError = Validations.isEmptyFirstName(firstName: self.firstName)
        let lastNameError = Validations.isEmptyLastName(lastName: self.lastName)
        let emailError = Validations.isEmptyEmail(email: self.email)
        let validEmailError = Validations.isValidEmail(email: self.email)
        let validPhoneError = Validations.isEmptyMobileNumber(mobileNumber: self.phone)
        let passwordError = Validations.isEmptyPassword(password: self.password)
        let confirmPasswordError = Validations.isEmptyConfirmPassword(confirmPassword: self.confirmPassword)
        let passwordAndConfirmPasswordMisMatchError = Validations.isPasswordAndConfirmPasswordMatch(password: self.password, confirmPassword: self.confirmPassword)
        
        if firstNameError != nil {
            return firstNameError?.rawValue
        } else if lastNameError != nil {
            return lastNameError?.rawValue
        } else if emailError != nil {
            return emailError?.rawValue
        } else if validEmailError != nil {
            return validEmailError?.rawValue
        } else if validPhoneError != nil {
            return validPhoneError?.rawValue
        } else if passwordError != nil {
            return passwordError?.rawValue
        } else if confirmPasswordError != nil {
            return confirmPasswordError?.rawValue
        } else if passwordAndConfirmPasswordMisMatchError != nil {
            return passwordAndConfirmPasswordMisMatchError?.rawValue
        } else if !isAcceptedTerms {
            return Titles.acceptTermsAndConditions
        } else {
            return nil
        }
    }
    
    //MARK: - PARAM
    func param() -> [String: Any] {
        let param = [AthleteOneParam.firstname.rawValue: firstName,
                     AthleteOneParam.lastname.rawValue: lastName,
                     AthleteOneParam.email.rawValue: email,
                     AthleteOneParam.phone.rawValue: phone,
                     AthleteOneParam.password.rawValue: password,
                     AthleteOneParam.passwordConfirmation.rawValue: confirmPassword,
                     AthleteOneParam.gender.rawValue: isSelectedGender.rawValue,
                     AthleteOneParam.deviceType.rawValue: "I",
                     AthleteOneParam.deviceId.rawValue: Constants.getDeviceId(),
                     AthleteOneParam.deviceToken.rawValue: Constants.getDeviceToken()
        ] as [String : Any]
        print(param)
        return param
    }
    
}

//MARK: - Extension
extension AthleteRegisterOneViewModel {
    //MARK: - API Integration
    func registerAthlete(with param: [String: Any], completionHandler: @escaping ((AtheleteRegisterOneModel?, String?) -> ())) {
        guard let url = URL(string: Constants.baseUrl + Constants.Urls.athleteRegister) else { fatalError("URL is incorrect.") }
        guard let data = try? JSONSerialization.data(withJSONObject: param, options: .fragmentsAllowed) else { fatalError("Error encoding order.") }
        var resource = Resource<AtheleteRegisterOneModel?>(url: url)
        resource.httpMethods = .post
        resource.body = data
        DispatchQueue.main.async { Spinner.start() }
        WebService().load(resource: resource) { result, jsonData in
            DispatchQueue.main.async { Spinner.stop() }
            switch result {
            case .success(let data):
                if let data = data {
                    completionHandler(data, nil)
                }
            case .failure(let error):
                let error = error.get()
                completionHandler(nil, error)
            }
        }
    }
}

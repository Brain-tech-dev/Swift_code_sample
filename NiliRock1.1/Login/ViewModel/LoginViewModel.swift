//
//  LoginViewModel.swift
//  NiliRock1.1
//
//  Created by Vijay's Braintech on 30/01/24.
//

import Foundation


struct LoginViewModel {
    
    //MARK: - Properties
    var email: String = ""
    var password: String = ""
    
    func validations() -> String? {
        let emailError = Validations.isEmptyEmail(email: self.email)
        let validEmailError = Validations.isValidEmail(email: self.email)
        let passwordError = Validations.isEmptyPassword(password: self.password)

        if emailError != nil {
            return emailError?.rawValue
        } else if validEmailError != nil {
            return validEmailError?.rawValue
        } else if passwordError != nil {
            return passwordError?.rawValue
        } else {
            return nil
        }
    }
    
    
    func param() -> [String: Any] {
        let param = [Login.email.rawValue: email,
                     Login.password.rawValue: password,
                     Login.deviceType.rawValue: "I",
                     Login.deviceId.rawValue: Constants.getDeviceId(),
                     Login.deviceToken.rawValue: Constants.getDeviceId(),
        ] as [String : Any]
        print(param)
        return param
    }
}

extension LoginViewModel {
    
    //MARK: - API Integration
    func login(with param: [String: Any], completionHandler: @escaping ((LoginModel?, String?) -> ())) {
        guard let url = URL(string: Constants.baseUrl + Constants.Urls.login) else { fatalError("URL is incorrect.") }
        print(url)
        guard let data = try? JSONSerialization.data(withJSONObject: param, options: .fragmentsAllowed) else { fatalError("Error encoding order.") }
        
        var resource = Resource<LoginModel?>(url: url)
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

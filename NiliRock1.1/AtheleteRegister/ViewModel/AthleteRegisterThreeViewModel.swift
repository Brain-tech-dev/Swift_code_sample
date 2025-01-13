//
//  AthleteRegisterThreeViewModel.swift
//  NiliRock1.1
//
//  Created by Vijay's Braintech on 31/01/24.
//

import Foundation

struct AthleteRegisterThreeViewModel {
    
    //MARK: - PROPERTIES
    var userDOB: String = ""
    
    //MARK: - validations
    func validations() -> String? {
        var dateError = Validations.isEmptyDate(date: self.userDOB)
        if dateError != nil {
            return dateError?.rawValue
        } else {
            return nil
        }
    }
    
    //MARK: - param
    func param() -> [String: Any?] {
        let param = [AthleteThreeParam.dob.rawValue: userDOB] as [String : Any?]
        print(param)
        return param
    }
    
    //MARK: - API Integration
    func updateAthleteDetail(with param: [String: Any], completionHandler: @escaping ((UpdateAthleteDetailModel?, String?) -> ())) {
        guard let url = URL(string: Constants.baseUrl + Constants.Urls.uploadDOB) else { fatalError("URL is incorrect.") }
        print(url)
        guard let data = try? JSONSerialization.data(withJSONObject: param, options: .fragmentsAllowed) else { fatalError("Error encoding order.") }
        var resource = Resource<UpdateAthleteDetailModel?>(url: url)
        resource.httpMethods = .put
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

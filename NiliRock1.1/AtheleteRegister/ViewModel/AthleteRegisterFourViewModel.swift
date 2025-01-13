//
//  AthleteRegisterFourViewModel.swift
//  NiliRock1.1
//
//  Created by Vijay's Braintech on 01/02/24.
//

import Foundation

class AthleteRegisterFourViewModel {
  
    //MARK: - PROPERTIES
    var pinCode: String?
    var countryId: Int?
    var stateId: Int?
    var schoolId: Int?
    
    func validation() -> String? {
        let countryNameError = Validations.isEmptyCountryId(countryID: countryId)
        let stateNameError = Validations.isEmptyStateId(state: stateId)
        let schoolNameError = Validations.isEmptyCollegeId(collegeId: schoolId)
        let pinCodeError = Validations.isEmptyPinCode(pin: pinCode)
        
        if countryNameError != nil {
            return countryNameError?.rawValue
        } else if stateNameError != nil {
            return stateNameError?.rawValue
        } else  if pinCodeError != nil {
            return pinCodeError?.rawValue
        } else if schoolNameError != nil {
            return schoolNameError?.rawValue
        }
        return nil
        
    }
    
    func param() -> [String: Any?] {
        let param = [AthleteFourParam.cityId.rawValue: stateId,AthleteFourParam.stateId.rawValue: countryId,AthleteFourParam.pinCode.rawValue: pinCode, AthleteFourParam.schoolId.rawValue: schoolId ] as [String : Any?]
        print(param)
        return param
    }
 
    //MARK: - API Integration
    func getCountryList(with completionHandler: @escaping ((CountryListModel?, String?) -> ())) {
        guard let url = URL(string: Constants.baseUrl + Constants.Urls.getStateList) else { fatalError("URL is incorrect.") }
        var resource = Resource<CountryListModel?>(url: url)
        resource.httpMethods = .get
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
    
    func getStateList(with id: Int, completionHandler: @escaping ((CountryListModel?, String?) -> ())) {
        guard let url = URL(string: Constants.baseUrl + Constants.Urls.getCityList + "\(id)") else { fatalError("URL is incorrect.") }
        var resource = Resource<CountryListModel?>(url: url)
        resource.httpMethods = .get
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
    
    func getCollegeList(with id: Int, completionHandler: @escaping ((CountryListModel?, String?) -> ())) {
        guard let url = URL(string: Constants.baseUrl + Constants.Urls.getSchoolList + "\(id)") else { fatalError("URL is incorrect.") }
        var resource = Resource<CountryListModel?>(url: url)
        resource.httpMethods = .get
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

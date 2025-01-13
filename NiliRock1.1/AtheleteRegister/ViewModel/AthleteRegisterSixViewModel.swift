//
//  AthleteRegisterSixViewModel.swift
//  NiliRock1.1
//
//  Created by Vijay's Braintech on 05/02/24.
//

import Foundation

class AthleteRegisterSixViewModel {
    
    //MARK: - PROPERTIES
    var athleteIndustrySelectedId = [Int]()
    
    //MARK: - Helpers
    func validations() -> String? {
        let arrayEmptyError = Validations.isEmptyIndustryId(arrayIndustryID: athleteIndustrySelectedId)
        if arrayEmptyError != nil {
            return arrayEmptyError?.rawValue
        } else {
            return nil
        }
    }
    
    func param() -> [String: Any?] {
        let param = [ AthleteSix.athleteIndustryId.rawValue: athleteIndustrySelectedId] as [String : Any?]
        print(param)
        return param
    }
    
    
    //MARK: - API Integration
    func getIndustryList(with completionHandler: @escaping ((SportListModel?, String?) -> ())) {
        
        guard let url = URL(string: Constants.baseUrl + Constants.Urls.athletesIndustryList) else { fatalError("URL is incorrect.") }
        print(url)
        var resource = Resource<SportListModel?>(url: url)
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
        
        guard let url = URL(string: Constants.baseUrl + Constants.Urls.uploadIndustry) else { fatalError("URL is incorrect.") }
        
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

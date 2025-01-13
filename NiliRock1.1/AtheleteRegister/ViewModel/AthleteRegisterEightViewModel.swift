//
//  AthleteRegisterEightViewModel.swift
//  NiliRock1.1
//
//  Created by Vijay's Braintech on 05/02/24.
//

import Foundation

class AthleteRegisterEightViewModel {
    
    
    //MARK: - PROPERTIES
    var payRangeIds = [Int]()
    
    //MARK: - Helpers
    func validations() -> String? {
            let priceRangeError = Validations.isEmptyPriceRange(priceRangeArray: payRangeIds)
            if priceRangeError != nil {
                return priceRangeError?.rawValue
            } else {
                return nil
            }
        }
    
    //MARK: - PARAM
    func param() -> [String: Any?] {
        let param = [ AthleteSeven.payRangeIds.rawValue: payRangeIds,
        ] as [String : Any?]
        print(param)
        return param
    }
    
    
    //MARK: - API Integration
    func getPriceRange(with completionHandler: @escaping ((PriceRangeModel?, String?) -> ())) {
        
        guard let url = URL(string: Constants.baseUrl + Constants.Urls.athletesPriceRangeList) else { fatalError("URL is incorrect.") }
        var resource = Resource<PriceRangeModel?>(url: url)
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
    
    //MARK: - API Integration
    func updateAthleteDetail(with param: [String: Any], completionHandler: @escaping ((UpdateAthleteDetailModel?, String?) -> ())) {
        
        guard let url = URL(string: Constants.baseUrl + Constants.Urls.updatePayRange) else { fatalError("URL is incorrect.") }
        
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

//
//  HomeViewModel.swift
//  NiliRock1.1
//
//  Created by Vijay's Braintech on 07/02/24.
//

import Foundation

class HomeViewModel {
   
    func getDashBoardList(with showIndicator: Bool, completionHandler: @escaping ((DashBoardModel?, String?) -> ())) {
        guard let url = URL(string: Constants.baseUrl + Constants.Urls.dashboardList) else { fatalError("URL is incorrect.") }
        print(url)
        var resource = Resource<DashBoardModel?>(url: url)
        resource.httpMethods = .get
        
        if showIndicator {
            DispatchQueue.main.async { Spinner.start() }
        }
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

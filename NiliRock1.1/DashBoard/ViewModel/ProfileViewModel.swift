//
//  ProfileViewModel.swift
//  NiliRock1.1
//
//  Created by Vijay's Braintech on 09/02/24.
//

import Foundation


struct ProfileViewModel {
    
    //MARK: -> Properties
    
    //MARK: - API INTEGRATION
    func userDetail(with completionHandler: @escaping ((ProfileDataModel?, String?) -> ())) {
        guard let url = URL(string: Constants.baseUrl + Constants.Urls.userDetail) else { fatalError("URL is incorrect.") }
        print(url)
        var resource = Resource<ProfileDataModel?>(url: url)
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
    
}

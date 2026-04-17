//
//  HomeService.swift
//  Carota
//
//  Created by Elias Ferreira on 28/02/25.
//

import Foundation

class HomeService {
    let provider = CloudProvider.shared
    
    func fetchLists() {
        provider.make(request: HomeRequest()) { (response: CAResponse<[HomeResponse]>) in
            if let error = response.error {
                print("API ERROR: \(error.localizedDescription)")
                return
            }
            
            if let object = response.object {
                print("API RESULT: success!!!")
                print(object)
            }
        }
    }
}

struct HomeRequest: CARequest {
    var endpoint: String = "list/getLists"
    var parameters: [String : Any]? = [
        "id": "c7b74d0c-ed44-4d9f-bf8f-84b34b1ebe71"
    ]
}

struct HomeResponse: Codable {
    let id: String
    let name: String
}

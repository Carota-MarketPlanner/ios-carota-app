//
//  ListsService.swift
//  Carota
//
//  Created by Elias Ferreira on 28/02/25.
//

import Foundation

class ListsService {
    let provider = CloudProvider.shared
    
    func fetchLists() {
        provider.make(request: ListsRequest()) { (response: CAResponse<[ListsResponse]>) in
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

struct ListsRequest: CARequest {
    var endpoint: String = "list/getLists"
    var parameters: [String : Any]? = [
        "id": "c7b74d0c-ed44-4d9f-bf8f-84b34b1ebe71"
    ]
}

struct ListsResponse: Codable {
    let id: String
    let name: String
}

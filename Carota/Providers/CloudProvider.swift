//
//  CloudProvider.swift
//  Carota
//
//  Created by Elias Ferreira on 27/02/25.
//

import Foundation
import NetCore

public class CloudProvider: CARequestProvider {
    private let baseUrl = Constants.Network.baseURLProd
    private let client = NCClient.shared
    private var authorization = String()
    
    static var shared: CARequestProvider = CloudProvider()
    
    func make<Response>(
        request: CARequest,
        completion: @escaping (CAResponse<Response>) -> Void
    ) where Response : Decodable {
        addAuthorizationToRequestIfNeeded()
        
        client.request(
            url: getURL(from: request),
            method: request.method.ncMethod,
            body: getBody(object: request.body)
        ) { response in
            switch response {
            case .success(let data):
                do {
                    let object = try JSONDecoder().decode(Response.self, from: data)
                    completion(.init(object: object))
                } catch {
                    completion(.init(error: error))
                }
                
            case .failure(let error):
                completion(.init(error: error))
            }
        }
    }
    
    public func setAuthorization(token: String) {
        self.authorization = token
    }
    
    private func addAuthorizationToRequestIfNeeded() {
        if !authorization.isEmpty {
            client.setAuthorization(.bearer(token: authorization))
        }
    }
    
    private func getURL(from request: CARequest) -> String {
        let params = request.parameters ?? [:]
        return baseUrl + "/" + request.endpoint + params.toRouteParams()
    }
    
    private func getBody(object: Encodable?) -> HTTPBody? {
        guard let object else { return nil }
        return .json(object: object)
    }
}

//
//  CloudProvider.swift
//  Carota
//
//  Created by Elias Ferreira on 27/02/25.
//

import CarotaService

public class CloudProvider: CARequestProvider {
    private let baseUrl = "https://carota-back-dev.onrender.com"
    private let client = CSCloudClient.shared
    private var authorization = String()
    
    static var shared: CARequestProvider = CloudProvider()
    
    func make<Response>(
        request: CARequest,
        completion: @escaping (CAResponse<Response>) -> Void
    ) where Response : Decodable {
        setAuthorizationIfNeeded()
        
        client.request(
            url: getURL(from: request),
            method: request.method.csMethod,
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
    
    private func setAuthorizationIfNeeded() {
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

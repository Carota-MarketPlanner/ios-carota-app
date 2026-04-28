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
    private var authorization = SessionManager.shared.token {
        didSet {
            addAuthorizationToRequestIfNeeded()
        }
    }
    
    static var shared: CARequestProvider = CloudProvider()
    
    func make<Response>(
        request: CARequest,
        completion: @escaping (CAResponse<Response>) -> Void
    ) where Response : Decodable {
        
        self.execute(request: request) { (response: CAResponse<Response>) in
            if let error = response.error {
                switch error {
                case .unauthorized: self.refreshToken(request: request, completion: completion)
                default : completion(response)
                }
            }
        }
    }
    
    private func execute<Response>(
        request: CARequest,
        with completion: @escaping (CAResponse<Response>) -> Void
    ) where Response : Decodable {
        
        client.request(
            url: getURL(from: request),
            method: getMethod(from: request.method),
            body: getBody(object: request.body)
        ) { (response: NCClient.NCDecodedResponse<Response>) in
            switch response {
            case .success(let object):
                completion(.init(object: object))
                
            case .failure(let error):
                completion(.init(error: self.getError(from: error)))
            }
        }
    }
    
    private func refreshToken<Response>(
        request: CARequest,
        completion: @escaping (CAResponse<Response>) -> Void
    ) where Response : Decodable {
        let body = HTTPBody.json(object: [
            Constants.Network.refreshTokenKey: SessionManager.shared.refreshToken
        ])
        
        client.request(
            url: getURL(from: Constants.Network.Endpoint.refreshToken),
            method: .post,
            body: body
        ) { (response: NCClient.NCDecodedResponse<LoginResponse>) in
            
            switch response {
            case .success(let loginResponse):
                SessionManager.shared.login(with: loginResponse)
                self.execute(request: request, with: completion)
            case .failure(let error):
                completion(.init(error: self.getError(from: error)))
                SessionManager.shared.clear()
            }
        }
    }
    
    private func addAuthorizationToRequestIfNeeded() {
        guard let auth = authorization, !auth.isEmpty else {
            client.clearAuthorization()
            return
        }
        
        client.setAuthorization(.bearer(token: auth))
    }
    
    private func getURL(from request: CARequest) -> String {
        let params = request.parameters ?? [:]
        return baseUrl + "/" + request.endpoint + params.toRouteParams()
    }
    
    private func getURL(from endpoint: String) -> String {
        return baseUrl + "/" + endpoint
    }
    
    private func getBody(object: Encodable?) -> HTTPBody? {
        guard let object else { return nil }
        return .json(object: object)
    }
    
    private func getMethod(from caMethod: CAMethod) -> HTTPMethod {
        switch caMethod {
        case .GET: .get
        case .POST: .post
        case .PUT: .put
        case .DELETE: .delete
        }
    }
    
    private func getError(from error: NCError) -> CAError {
        switch error {
        case .unauthorized: .unauthorized
        default: .apiError
        }
    }
}

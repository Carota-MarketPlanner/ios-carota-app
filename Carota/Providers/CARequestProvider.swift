//
//  CARequestProvider.swift
//  Carota
//
//  Created by Elias Ferreira on 27/02/25.
//

import NetCore

enum CAMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
    
    var ncMethod: HTTPMethod {
        switch self {
        case .GET:
            return .get
        case .POST:
            return .post
        case .PUT:
            return .put
        case .DELETE:
            return .delete
        }
    }
}

class CAResponse<Response: Decodable> {
    var object: Response?
    var error: Error?
    
    init(object: Response? = nil, error: Error? = nil) {
        self.object = object
        self.error = error
    }
}

protocol CARequest {
    var endpoint: String { get }
    var method: CAMethod { get }
    var parameters: [String: Any]? { get }
    var body: Encodable? { get }
}

extension CARequest {
    var method: CAMethod { .GET }
    var parameters: [String: Any]? { nil }
    var body: Encodable? { nil }
}

protocol CARequestProvider {
    func make<Response: Decodable>(
        request: CARequest,
        completion: @escaping (CAResponse<Response>) -> Void
    )
    func setAuthorization(token: String)
}

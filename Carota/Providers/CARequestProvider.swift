//
//  CARequestProvider.swift
//  Carota
//
//  Created by Elias Ferreira on 27/02/25.
//

import Foundation

enum CAMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
}

enum CAError: Error {
    case apiError
    case unauthorized
}

class CAResponse<Response: Decodable> {
    var object: Response?
    var error: CAError?
    
    init(object: Response? = nil, error: CAError? = nil) {
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
}

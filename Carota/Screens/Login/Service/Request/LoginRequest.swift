//
//  LoginRequest.swift
//  Carota
//
//  Created by Elias Ferreira on 28/02/25.
//

import Foundation

struct LoginRequest: CARequest {
    var endpoint: String = LoginConstants.Endpoint.login
    var method: CAMethod = .POST
    var body: Encodable?
}

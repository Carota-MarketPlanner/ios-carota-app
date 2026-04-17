//
//  LoginResponse.swift
//  Carota
//
//  Created by Elias Ferreira on 28/02/25.
//

import Foundation

struct LoginResponse: Codable {
    let user: LoginUser
    let token: String
    let refreshToken: String
}

struct LoginUser: Codable {
    let id: String
    let name: String
    let email: String
}

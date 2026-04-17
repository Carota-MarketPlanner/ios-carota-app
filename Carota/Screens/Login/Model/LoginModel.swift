//
//  LoginModel.swift
//  Carota
//
//  Created by Elias Ferreira on 28/02/25.
//

import Foundation

struct LoginModel: Codable {
    var user: User
    var token: String
    var refreshToken: String
}

struct User: Codable {
    var id: String
    var name: String
    var email: String
}

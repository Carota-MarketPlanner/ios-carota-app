//
//  SessionConstants.swift
//  Carota
//
//  Created by Elias Ferreira on 18/03/25.
//

import Foundation

struct SessionConstants {
    struct Keychain {
        static var authTokenKey: String = "authToken"
        static var refreshTokenKey: String = "refreshToken"
    }
    
    struct UserDefaults {
        static var userKey: String = "loggedUser"
    }
}

//
//  SessionManager.swift
//  Carota
//
//  Created by Elias Ferreira on 18/03/25.
//

import Foundation
import Combine

class SessionManager: ObservableObject {
    static let shared = SessionManager()
    
    @Published var user: LoginUser?
    @Published var token: String?
    @Published var refreshToken: String?
    
    var isLoggedIn: Bool {
        token != nil && user != nil
    }
    
    private init() {
        loadSession()
    }

    func login(with model: LoginResponse) {
        self.user = model.user
        self.token = model.token
        self.refreshToken = model.refreshToken
        saveUserToUserDefaults(model.user)
        saveTokenToKeychain(model.token)
        saveRefreshTokenToKeychain(model.refreshToken)
    }

    func clear() {
        self.user = nil
        self.token = nil
        self.refreshToken = nil
        clearKeychain()
        clearUserDefaults()
    }
    
    private func loadSession() {
        self.user = loadUserFromUserDefaults()
        self.token = loadTokenFromKeychain()
        self.refreshToken = loadRefreshTokenFromKeychain()
    }
}

//
//  SessionManager.swift
//  Carota
//
//  Created by Elias Ferreira on 18/03/25.
//

import Combine

class SessionManager: ObservableObject {
    static let shared = SessionManager()
    
    @Published var user: LoginUser?
    @Published var token: String? {
        didSet {
            saveTokenToKeychain(token)
        }
    }
    @Published var refreshToken: String? {
        didSet {
            saveRefreshTokenToKeychain(refreshToken)
        }
    }
    
    private init() {
        loadSession()
    }

    func login(with response: LoginResponse) {
        self.user = response.user
        self.token = response.token
        self.refreshToken = response.refreshToken
        saveUserToUserDefaults(response.user)
    }

    func logout() {
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

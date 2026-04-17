//
//  SessionManager.swift
//  Carota
//
//  Created by Elias Ferreira on 18/03/25.
//

import Combine

class SessionManager: ObservableObject {
    static let shared = SessionManager()
    
    @Published var user: User?
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
    
    var isLoggedIn: Bool {
        token != nil
    }
    
    private init() {
        loadSession()
    }

    func login(with model: LoginModel) {
        self.user = model.user
        self.token = model.token
        self.refreshToken = model.refreshToken
        saveUserToUserDefaults(model.user)
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

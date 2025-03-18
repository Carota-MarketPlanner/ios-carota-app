//
//  SessionManager+Keychain.swift
//  Carota
//
//  Created by Elias Ferreira on 18/03/25.
//

extension SessionManager {
    internal func saveTokenToKeychain(_ token: String?) {
        KeychainHelper.standard.save(token ?? "", service: "authToken")
    }
    
    internal func saveRefreshTokenToKeychain(_ refreshToken: String?) {
        KeychainHelper.standard.save(refreshToken ?? "", service: "refreshToken")
    }
    
    internal func loadTokenFromKeychain() -> String? {
        return KeychainHelper.standard.read(service: "authToken")
    }
    
    internal func loadRefreshTokenFromKeychain() -> String? {
        return KeychainHelper.standard.read(service: "refreshToken")
    }
    
    internal func clearKeychain() {
        KeychainHelper.standard.delete(service: "authToken")
        KeychainHelper.standard.delete(service: "refreshToken")
    }
}

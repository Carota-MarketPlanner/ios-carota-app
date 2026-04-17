//
//  SessionManager+Keychain.swift
//  Carota
//
//  Created by Elias Ferreira on 18/03/25.
//

extension SessionManager {
    internal func saveTokenToKeychain(_ token: String?) {
        if let token, !token.isEmpty {
            KeychainHelper.standard.save(
                token,
                service: SessionConstants.Keychain.authTokenKey
            )
        }
    }
    
    internal func saveRefreshTokenToKeychain(_ refreshToken: String?) {
        if let refreshToken, !refreshToken.isEmpty {
            KeychainHelper.standard.save(
                refreshToken,
                service: SessionConstants.Keychain.refreshTokenKey
            )
        }
    }
    
    internal func loadTokenFromKeychain() -> String? {
        return KeychainHelper.standard.read(
            service: SessionConstants.Keychain.authTokenKey
        )
    }
    
    internal func loadRefreshTokenFromKeychain() -> String? {
        return KeychainHelper.standard.read(
            service: SessionConstants.Keychain.refreshTokenKey
        )
    }
    
    internal func clearKeychain() {
        KeychainHelper.standard.delete(
            service: SessionConstants.Keychain.authTokenKey
        )
        KeychainHelper.standard.delete(
            service: SessionConstants.Keychain.refreshTokenKey
        )
    }
}

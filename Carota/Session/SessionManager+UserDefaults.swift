//
//  SessionManager+UserDefaults.swift
//  Carota
//
//  Created by Elias Ferreira on 18/03/25.
//

import Foundation

extension SessionManager {
    internal func saveUserToUserDefaults(_ user: User) {
        if let encodedUser = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(encodedUser, forKey: SessionConstants.UserDefaults.userKey)
        }
    }
    
    internal func loadUserFromUserDefaults() -> User? {
        if let savedData = UserDefaults.standard.data(forKey: SessionConstants.UserDefaults.userKey),
           let decodedUser = try? JSONDecoder().decode(User.self, from: savedData) {
            return decodedUser
        }
        return nil
    }
    
    internal func clearUserDefaults() {
        UserDefaults.standard.removeObject(forKey: SessionConstants.UserDefaults.userKey)
    }
}

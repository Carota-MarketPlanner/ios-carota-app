//
//  SessionManager+UserDefaults.swift
//  Carota
//
//  Created by Elias Ferreira on 18/03/25.
//

import Foundation

extension SessionManager {
    internal func saveUserToUserDefaults(_ user: LoginUser) {
        if let encodedUser = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(encodedUser, forKey: "loggedUser")
        }
    }
    
    internal func loadUserFromUserDefaults() -> LoginUser? {
        if let savedData = UserDefaults.standard.data(forKey: "loggedUser"),
           let decodedUser = try? JSONDecoder().decode(LoginUser.self, from: savedData) {
            return decodedUser
        }
        return nil
    }
    
    internal func clearUserDefaults() {
        UserDefaults.standard.removeObject(forKey: "loggedUser")
    }
}

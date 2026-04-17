//
//  LoginConstants.swift
//  Carota
//
//  Created by Elias Ferreira on 28/02/25.
//

import Foundation

public enum LoginConstants {
    public enum Endpoint {}
}

extension LoginConstants.Endpoint {
    private static let base = "user"
    public static let login = base + "/login"
}

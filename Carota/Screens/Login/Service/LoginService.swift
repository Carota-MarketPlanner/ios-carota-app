//
//  LoginService.swift
//  Carota
//
//  Created by Elias Ferreira on 27/02/25.
//
import Foundation

protocol LoginService {
    func testConnection()
}

class LoginServiceConcrete: LoginService {
    let provider = CloudService()
    
    let body = LoginBody(email: "test@market.com", password: "123123")
    
    func testConnection() {
        provider.make(
            request: LoginRequest(body: body)
        ) { (response: CAResponse<LoginResponse>) in
            if let error = response.error {
                print("API ERROR: \(error.localizedDescription)")
                return
            }
            
            if let object = response.object {
                print("API RESULT: success!!!")
                print(object)
            }
        }
    }
}

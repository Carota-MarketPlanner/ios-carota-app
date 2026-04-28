//
//  LoginService.swift
//  Carota
//
//  Created by Elias Ferreira on 27/02/25.
//
import Foundation

protocol LoginService {
    var provider: CARequestProvider { get }
    func login(body: LoginBody, completion: @escaping (Result<User, Error>) -> Void)
}

class LoginServiceConcrete: LoginService {
    let provider = CloudProvider.shared
    
    func login(body: LoginBody, completion: @escaping (Result<User, Error>) -> Void)  {
        provider.make(
            request: LoginRequest(body: body)
        ) { (response: CAResponse<LoginResponse>) in
            if let error = response.error {
                print(error.localizedDescription)
                completion(.failure(error))
            }
            
            if let loginResponse = response.object {
                completion(.success(self.parseLoginResponse(loginResponse)))
            }
        }
    }
    
    private func parseLoginResponse(_ response: LoginResponse) -> User {
        return User(
            name: response.user.name,
            email: response.user.email
        )
    }
}

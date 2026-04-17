//
//  LoginService.swift
//  Carota
//
//  Created by Elias Ferreira on 27/02/25.
//
import Foundation

protocol LoginService {
    var provider: CARequestProvider { get }
    func login(body: LoginBody, completion: @escaping (Result<LoginModel, Error>) -> Void)
}

class LoginServiceConcrete: LoginService {
    let provider = CloudProvider.shared
    
    func login(body: LoginBody, completion: @escaping (Result<LoginModel, Error>) -> Void)  {
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
    
    private func parseLoginResponse(_ response: LoginResponse) -> LoginModel {
        return LoginModel(
            user: User(
                id: response.user.id,
                name: response.user.name,
                email: response.user.email
            ),
            token: response.token,
            refreshToken: response.refreshToken
        )
    }
}

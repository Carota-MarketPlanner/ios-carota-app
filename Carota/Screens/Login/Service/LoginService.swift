//
//  LoginService.swift
//  Carota
//
//  Created by Elias Ferreira on 27/02/25.
//
import Foundation

protocol LoginService {
    func login(body: LoginBody, completion: @escaping (Result<Void, Error>) -> Void)
}

class LoginServiceConcrete: LoginService {
    let provider = CloudProvider.shared
    
    func login(body: LoginBody, completion: @escaping (Result<Void, Error>) -> Void)  {
        provider.make(
            request: LoginRequest(body: body)
        ) { (response: CAResponse<LoginResponse>) in
            if let error = response.error {
                print(error.localizedDescription)
                completion(.failure(error))
            }
            
            if let _ = response.object {
                completion(.success(Void()))
            }
        }
    }
}

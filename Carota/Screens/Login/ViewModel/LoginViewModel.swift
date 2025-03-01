//
//  LoginViewModel.swift
//  Carota
//
//  Created by Elias Ferreira on 28/02/25.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email = Constants.empty
    @Published var password = Constants.empty
    
    @Binding var isLogged: Bool
    
    let service: LoginService
    
    init(isLogged: Binding<Bool>) {
        self.service = LoginServiceConcrete()
        _isLogged = isLogged
    }
    
    func login() {
        service.login(
            body: LoginBody(email: email, password: password)
        ) { result in
            switch result {
            case .success:
                self.isLogged = true
                
            case .failure:
                self.isLogged = false
            }
        }
    }
}

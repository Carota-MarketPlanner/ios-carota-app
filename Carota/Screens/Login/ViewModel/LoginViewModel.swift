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
    @Published var isLoading: Bool = false
    
    let service: LoginService
    
    init() {
        self.service = LoginServiceConcrete()
    }
    
    func login() {
        isLoading = true
        service.login(
            body: LoginBody(email: email, password: password)
        ) { result in
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let response):
//                    SessionManager.shared.login(with: response)
//                    
//                case .failure:
//                    SessionManager.shared.logout()
//                }
//                
//                self.isLoading = false
//            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                SessionManager.shared.login(
                    with: LoginResponse(
                        user: LoginUser(
                            id: "id",
                            name: "Elias Ferreria",
                            email: "eliasferreira@carota.com"
                        ),
                        token: "token asdf",
                        refreshToken: "refresh asdf"
                    )
                )
                self.isLoading = false
            }
        }
    }
}

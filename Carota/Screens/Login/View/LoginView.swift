//
//  ContentView.swift
//  Carota
//
//  Created by Elias Ferreira on 01/09/24.
//

import SwiftUI
import CDSComponents

struct LoginView: View {
    @CDSThemeCore var theme: CDSTheme
    
    @State var email: String = Constants.empty
    @State var password: String = Constants.empty
    @State var goToSignInValue: Bool = false
    
    private var logger: (Bool) -> Void
    private var service = LoginServiceConcrete()
    private var listService = ListsService()
    
    init(logger: @escaping (Bool) -> Void) {
        self.logger = logger
    }
    
    // MARK: - Views
    
    var body: some View {
        NavigationStack {
            VStack(spacing: Constants.bodySpace) {
                Image(Constants.Image.logoSignColor)
                    .resizable()
                    .frame(maxWidth: Constants.logoWidht, maxHeight: Constants.logoHeight)
                    .aspectRatio(contentMode: .fit)
                
                formStack
            }
            .padding(theme.sizes.margin)
            .background(theme.colors.white.color)
            .onTapGesture {
                dismissKeyBoard()
            }
            .navigationDestination(isPresented: $goToSignInValue) {
                SigninView() {
                    goToSignInValue = false
                    logger(true)
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
    
    private var formStack: some View {
        VStack(spacing: Constants.formStackSpacing) {
            titleStack
            
            VStack(spacing: Constants.formStackInterSpacing) {
                CDSTextField(Constants.email, text: $email, type: .email)
                VStack(spacing: Constants.actionLabelSpacing) {
                    CDSTextField(Constants.password, text: $password, type: .password)
                    HStack {
                        Spacer()
                        CDSActionLabel(content: [
                            .button(text: Constants.forgotPassword, action: forgotPasswordAction)
                        ])
                    }
                }
                
                buttonStack
            }

            Spacer()
        }
    }
    
    private var titleStack: some View {
        HStack {
            VStack(alignment: .leading, spacing: Constants.titleSpacing) {
                CDSLabel(style: .primary(Constants.login, type: .largeTitle))
                CDSLabel(style: .secondary(Constants.subtitle, type: .content))
            }
            Spacer()
        }
    }
    
    private var buttonStack: some View {
        VStack(spacing: Constants.buttonSpacing) {
            CDSButton(Constants.login, style: .primary(size: .infinity)) {
                service.testConnection()
                logger(true)
            }
            
            CDSActionLabel(content: [
                .text(text: Constants.noAccount),
                .button(text: Constants.signIn, action: goToSignIn)
            ])
        }
    }
    
    // MARK: - Actions
    private func forgotPasswordAction() {
        print("Esqueceu sua senha?")
    }
    
    private func goToSignIn() {
        goToSignInValue = true
    }
    
    private func dismissKeyBoard() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }
}

#Preview {
    LoginView() { _ in }
}

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
    
    @State var email: String = LoginConstants.empty
    @State var password: String = LoginConstants.empty
    
    var body: some View {
        VStack(spacing: LoginConstants.bodySpace) {
            Image(LoginConstants.Image.logoSignColor)
                .resizable()
                .frame(maxWidth: LoginConstants.logoWidht, maxHeight: LoginConstants.logoHeight)
                .aspectRatio(contentMode: .fit)
            
            formStack
        }
        .padding(theme.sizes.margin)
        .background(theme.colors.white.color)
        .onTapGesture {
            dismissKeyBoard()
        }
    }
    
    // MARK: - Views
    private var formStack: some View {
        VStack(spacing: LoginConstants.formStackSpacing) {
            titleStack
            
            VStack(spacing: LoginConstants.formStackInterSpacing) {
                CDSTextField(LoginConstants.email, text: $email, type: .email)
                VStack(spacing: LoginConstants.actionLabelSpacing) {
                    CDSTextField(LoginConstants.password, text: $password, type: .password)
                    HStack {
                        Spacer()
                        CDSActionLabel(content: [
                            .button(text: LoginConstants.forgotPassword, action: forgotPasswordAction)
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
            VStack(alignment: .leading, spacing: LoginConstants.titleSpacing) {
                CDSLabel(style: .primary(LoginConstants.title, type: .largeTitle))
                CDSLabel(style: .secondary(LoginConstants.subtitle, type: .content))
            }
            Spacer()
        }
    }
    
    private var buttonStack: some View {
        VStack(spacing: LoginConstants.buttonSpacing) {
            CDSButton(LoginConstants.title, style: .primary(size: .infinity)) {
                print("Login")
            }
            
            CDSActionLabel(content: [
                .text(text: LoginConstants.noAccount),
                .button(text: LoginConstants.signIn, action: goToSignIn)
            ])
        }
    }
    
    // MARK: - Actions
    private func forgotPasswordAction() {
        print("Esqueceu sua senha?")
    }
    
    private func goToSignIn() {
        print("Cadastre-se")
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
    LoginView()
}

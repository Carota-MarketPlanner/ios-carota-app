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
    
    // MARK: - Views
    
    var body: some View {
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
                print("Login")
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

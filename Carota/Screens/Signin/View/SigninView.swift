//
//  SigninView.swift
//  Carota
//
//  Created by Elias Ferreira on 03/09/24.
//

import SwiftUI
import CDSComponents

struct SigninView: View {
    @CDSThemeCore var theme: CDSTheme
    
    @State var name: String = Constants.empty
    @State var email: String = Constants.empty
    @State var password: String = Constants.empty
    @State var retypedPassword: String = Constants.empty
    
    var body: some View {
        ScrollView {
            VStack(spacing: Constants.signinBodySpace) {
                Image(Constants.Image.logoSignColor)
                    .resizable()
                    .frame(maxWidth: Constants.logoWidht, maxHeight: Constants.logoHeight)
                    .aspectRatio(contentMode: .fit)
                
                formStack
                Spacer()
            }
            .padding(theme.sizes.margin)
        }
        .background(theme.colors.white.color)
        .onTapGesture {
            dismissKeyBoard()
        }
    }
    
    private var formStack: some View {
        VStack(spacing: Constants.signinButtonSpacing) {
            VStack(spacing: Constants.signinFormStackSpacing) {
                titleStack
                
                CDSTextField(Constants.name, text: $name, type: .capitalized)
                CDSTextField(Constants.email, text: $email, type: .email)
                CDSTextField(Constants.password, text: $password, type: .password)
                CDSTextField(Constants.retypePassword, text: $retypedPassword, type: .password)
            }
            
            buttonStack
        }
    }
    
    private var titleStack: some View {
        HStack {
            VStack(alignment: .leading, spacing: Constants.titleSpacing) {
                CDSLabel(style: .primary(Constants.signIn, type: .largeTitle))
                CDSLabel(style: .secondary(Constants.signInSubtitle, type: .content))
            }
            Spacer()
        }
    }
    
    private var buttonStack: some View {
        VStack(spacing: Constants.buttonSpacing) {
            CDSButton(Constants.signIn, style: .primary(size: .infinity)) {
                print("SignIn")
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
    SigninView()
}

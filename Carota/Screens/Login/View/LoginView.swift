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
    
    @State var goToSignInValue: Bool = false
    
    @ObservedObject var viewModel: LoginViewModel
    
    var buttonState: CDSButtonStyle.CDSButtonState {
        viewModel.isLoading ?
            .loading : (
                viewModel.email.isEmpty || viewModel.password.isEmpty ?
                    .disabled :
                    .enabled
        )
    }
    
    init() {
        viewModel = LoginViewModel()
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
                }
            }
        }
    }
    
    private var formStack: some View {
        VStack(spacing: Constants.formStackSpacing) {
            titleStack
            
            VStack(spacing: Constants.formStackInterSpacing) {
                CDSTextField(Constants.email, text: $viewModel.email, type: .email)
                VStack(spacing: Constants.actionLabelSpacing) {
                    CDSTextField(Constants.password, text: $viewModel.password, type: .password)
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
            CDSButton(Constants.login,
                      style: .primary(size: .infinity,
                                      state: buttonState)) {
                viewModel.login()
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
    LoginView()
}

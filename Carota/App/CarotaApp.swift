//
//  CarotaApp.swift
//  Carota
//
//  Created by Elias Ferreira on 01/09/24.
//

import SwiftUI
import CarotaTheme
import CDSComponents

@main
struct CarotaApp: App {
    @StateObject private var session = SessionManager.shared
    
    private var isLogged: Bool {
        session.token != nil
    }
    
    init() {
        CDSThemeCore.setTheme(theme: CDSCarotaTheme())
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
//                LoginView(isLogged: $isLogged)
//                    .fullScreenCover(isPresented: .constant(isLogged)) {
//                        HomeView(isLogged: $isLogged)// Aplica a transição personalizada
//                    }
                ZStack {
                    getMainView()
                }
                .animation(.easeInOut(duration: 0.3), value: isLogged)
            }
        }
    }
    
    @ViewBuilder
    func getMainView() -> some View {
        if isLogged {
            HomeView()
                .transition(
                    .asymmetric(
                        insertion: .move(edge: .trailing).combined(with: .opacity),
                        removal: .scale(scale: 1.1).combined(with: .opacity)
                    )
                )
        } else {
            LoginView()
                .transition(
                    .asymmetric(
                        insertion: .move(edge: .leading).combined(with: .opacity),
                        removal: .opacity
                    )
                )
        }
    }
}

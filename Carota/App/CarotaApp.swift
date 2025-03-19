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
            ZStack {
                getMainView()
            }
            .animation(.easeInOut(duration: 0.3), value: isLogged)
        }
    }
    
    @ViewBuilder
    func getMainView() -> some View {
        if isLogged {
            HomeView()
                .transition(
                    .asymmetric(
                        insertion: .move(edge: .trailing),
                        removal: .identity
                    )
                )
                
        } else {
            LoginView()
                .transition(
                    .asymmetric(
                        insertion: .slide,
                        removal: .identity
                    )
                )
        }
    }
}

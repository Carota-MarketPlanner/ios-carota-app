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
    @State var logged: Bool = false
    
    init() { CDSThemeCore.setTheme(theme: CDSCarotaTheme()) }
    
    var body: some Scene {
        WindowGroup {
            withAnimation {
                getMainView()
            }
        }
    }
    
    @ViewBuilder
    func getMainView() -> some View {
        if logged {
            HomeView(logger: logger)
        } else {
            LoginView(logger: logger)
        }
    }
    
    func logger(isLogged: Bool) {
        
            logged = isLogged
        
    }
}

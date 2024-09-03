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
    init() {
        CDSThemeCore.setTheme(theme: CDSCarotaTheme())
    }
    
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}

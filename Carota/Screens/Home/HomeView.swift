//
//  HomeView.swift
//  Carota
//
//  Created by Elias Ferreira on 03/09/24.
//

import SwiftUI

struct HomeView: View {
    @State var gotToSettings: Bool = false
    
    private var service = HomeService()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Text("Hello, World!")
                Button("Settings") {
                    gotToSettings = true
                }
                Spacer()
                Button("Logout") {
                    SessionManager.shared.logout()
                }
                Spacer()
            }
            .navigationDestination(isPresented: $gotToSettings) {
                ItemsView()
            }
        }
    }
}

#Preview {
    HomeView()
}

//
//  HomeView.swift
//  Carota
//
//  Created by Elias Ferreira on 03/09/24.
//

import SwiftUI

struct HomeView: View {
    
    private var service = HomeService()
    
    var body: some View {
        VStack {
            Spacer()
            Text("Hello, World!")
            Button("Logout") {
                SessionManager.shared.logout()
            }
            Spacer()
            Button("Get Lists") {
                service.fetchLists()
            }
            Spacer()
        }
    }
}

#Preview {
    HomeView()
}

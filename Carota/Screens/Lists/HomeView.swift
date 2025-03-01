//
//  HomeView.swift
//  Carota
//
//  Created by Elias Ferreira on 03/09/24.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.dismiss) var dismiss
    
    private var service = ListsService()
    @Binding var isLogged: Bool
    
    init(isLogged: Binding<Bool>) {
        _isLogged = isLogged
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Text("Hello, World!")
                Button("Logout") {
                    isLogged = false
                }
                Spacer()
                Button("Get Lists") {
                    service.fetchLists()
                }
                Spacer()
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
//    HomeView() { _ in }
}

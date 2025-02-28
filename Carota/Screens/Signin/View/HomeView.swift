//
//  HomeView.swift
//  Carota
//
//  Created by Elias Ferreira on 03/09/24.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.dismiss) var dismiss
    
    private var logger: (Bool) -> Void
    
    init(logger: @escaping (Bool) -> Void) {
        self.logger = logger
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Hello, World!")
                Button("Logout") {
                    logger(false)
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    HomeView() { _ in }
}

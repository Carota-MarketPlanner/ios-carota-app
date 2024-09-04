//
//  HomeView.swift
//  Carota
//
//  Created by Elias Ferreira on 03/09/24.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Text("Hello, World!")
            Button("Logout") {
                dismiss()
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    HomeView()
}

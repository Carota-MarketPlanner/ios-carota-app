//
//  ContentView.swift
//  Carota
//
//  Created by Elias Ferreira on 01/09/24.
//

import SwiftUI
import CDSComponents

struct LoginView: View {
    var body: some View {
        VStack {
            CDSLabel(style: .primary("Login", type: .largeTitle))
        }
        .padding()
    }
}

#Preview {
    LoginView()
}

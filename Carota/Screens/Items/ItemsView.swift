//
//  ItemsView.swift
//  Carota
//
//  Created by Elias Ferreira on 18/03/25.
//

import SwiftUI

struct ItemsView: View {
    
    var body: some View {
        Text("Items")
        
        Button("Logout") {
            SessionManager.shared.clear()
        }
    }
}

#Preview {
    ItemsView()
}

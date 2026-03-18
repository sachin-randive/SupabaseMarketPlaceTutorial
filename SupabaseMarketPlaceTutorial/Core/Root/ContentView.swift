//
//  ContentView.swift
//  SupabaseMarketPlaceTutorial
//
//  Created by Sachin Randive on 17/03/26.
//

import SwiftUI

struct ContentView: View {
    @Environment(AuthManager.self) private var authManager
    
    var body: some View {
        Group {
            switch authManager.authState {
            case .authenticated:
                Text("Main Interface ...")
            case .unauthenticated:
                LoginView()
            case .unknown:
                ProgressView()
            }
        }
        .task { await authManager.refreshUser() }
    }
}

#Preview {
    ContentView()
        .environment(AuthManager())
}

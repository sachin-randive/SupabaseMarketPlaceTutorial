//
//  SupabaseMarketPlaceTutorialApp.swift
//  SupabaseMarketPlaceTutorial
//
//  Created by Sachin Randive on 17/03/26.
//

import SwiftUI

@main
struct SupabaseMarketPlaceTutorialApp: App {
    
    @State private var authManager = AuthManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(authManager)
        }
    }
}

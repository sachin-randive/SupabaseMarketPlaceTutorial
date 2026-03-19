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
    @State private var userManager = UserManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(authManager)
                .environment(userManager)
        }
    }
}

//
//  UserProfileView.swift
//  SupabaseMarketPlaceTutorial
//
//  Created by Sachin Randive on 19/03/26.
//

import SwiftUI

struct UserProfileView: View {
    @Environment(AuthManager.self) private var authManager
    
    var body: some View {
        
        Button("Sign Out") {
            Task{ await authManager.signOut() }
        }
    }
}

#Preview {
    UserProfileView()
        .environment(AuthManager())
}

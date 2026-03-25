//
//  MainTabBar.swift
//  SupabaseMarketPlaceTutorial
//
//  Created by Sachin Randive on 25/03/26.
//

import SwiftUI

enum TabIdentifier: Hashable {
    case feed
    case createListing
    case notification
    case profile
}

struct MainTabBar: View {
    @State private var selectedTab: TabIdentifier = .feed
    var body: some View {
        TabView(selection: $selectedTab) {
            Tab("Feed", systemImage: "house", value: TabIdentifier.feed) {
                Text("Feed View")
            }
            
            Tab("Sell", systemImage: "plus.circle", value: TabIdentifier.createListing) {
                CreateListingView()
            }
            
            Tab("Notification", systemImage: "heart", value: TabIdentifier.notification) {
                Text("Notification")
            }
            
            Tab("Profile", systemImage: "person", value: TabIdentifier.profile) {
                UserProfileView()
            }
            
        }
    }
}

#Preview {
    MainTabBar()
        .environment(AuthManager())
        .environment(UserManager())
}

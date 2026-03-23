//
//  UserProfileView.swift
//  SupabaseMarketPlaceTutorial
//
//  Created by Sachin Randive on 19/03/26.
//

import SwiftUI

struct UserProfileView: View {
    @Environment(AuthManager.self) private var authManager
    @Environment(UserManager.self) private var userManager
    
    @State private var isPresentingImagePicker: Bool = false
    
    var body: some View {
        
        NavigationStack {
            List {
                if let currentUser = userManager.currentUser {
                    Section {
                        /*HStack {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .frame(width: 72, height: 72)
                                .foregroundStyle(.secondary)
                            
                            VStack(alignment: .leading) {
                                Text(currentUser.username)
                                
                                Text(currentUser.email)
                                    .foregroundStyle(.secondary)
                            }
                            .font(.subheadline)
                        }*/
                        AvatarView(imageUrl: currentUser.profileImageUrl, profileImage: nil, size: .large) {
                            isPresentingImagePicker = true
                        }
                    }
                    
                    Section("Account") {
                        Button("Sign Out", role: .destructive) {
                            Task{ await authManager.signOut() }
                        }
                    }
                }
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    UserProfileView()
        .environment(AuthManager())
        .environment(UserManager())
}

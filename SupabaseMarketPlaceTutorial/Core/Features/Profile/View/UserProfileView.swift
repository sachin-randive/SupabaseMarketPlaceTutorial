//
//  UserProfileView.swift
//  SupabaseMarketPlaceTutorial
//
//  Created by Sachin Randive on 19/03/26.
//

import SwiftUI
import PhotosUI

struct UserProfileView: View {
    @Environment(AuthManager.self) private var authManager
    @Environment(UserManager.self) private var userManager
    
    @State private var isPresentingImagePicker: Bool = false
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var profileImage: Image? = nil
    
    var body: some View {
        
        NavigationStack {
            List {
                if let currentUser = userManager.currentUser {
                    Section {
                        HStack(spacing: 12) {
                            AvatarView(
                                imageUrl: currentUser.profileImageUrl,
                                profileImage: profileImage,
                                size: .large
                            ) {
                                isPresentingImagePicker = true
                            }
                            VStack(alignment: .leading) {
                                Text(currentUser.username)
                                
                                Text(currentUser.email)
                                    .foregroundStyle(.secondary)
                            }
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
        .photosPicker(isPresented: $isPresentingImagePicker, selection: $selectedItem)
        .task(id: selectedItem ) { await onImageSelected() }
    }
}

private extension UserProfileView {
    func onImageSelected() async {
        guard let selectedItem else { return }
        guard let user = userManager.currentUser else { return }
        do {
            guard let data = try await selectedItem.loadTransferable(type: Data.self) else { return }
            guard let uiImage = UIImage(data: data) else { return }
            guard let imageData = uiImage.jpegData(compressionQuality: 0.5) else { return }
            profileImage = Image(uiImage: uiImage)
            
            let imageUrl = try await StorageManager().uploadProfilePhoto(for: user, imageData: imageData)
            await userManager.updateProfileImageURL(imageUrl)
        } catch {
            print("Failed to upload image data: \(error.localizedDescription)")
        }
    }
}

#Preview {
    UserProfileView()
        .environment(AuthManager())
        .environment(UserManager())
}

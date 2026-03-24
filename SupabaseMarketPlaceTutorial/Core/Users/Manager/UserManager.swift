//
//  UserManager.swift
//  SupabaseMarketPlaceTutorial
//
//  Created by Sachin Randive on 19/03/26.
//

import Foundation

@Observable
final class UserManager {
    var currentUser: User?
    var isLoading = false
    
    private let service: UserService
    
    init(service: UserService = UserService()) {
        self.service = service
    }
    
    func fetchCurrentUser() async {
        isLoading = true
        defer { isLoading = false }
        do {
            self.currentUser = try await service.fetchCurrentUser()
           
            print("DEBUG: Current user: \(String(describing: currentUser))")
        } catch {
            print("DEBUG: Failed to fetch current user:\(error.localizedDescription)")
        }
    }
    
    func updateProfileImageURL(_ imageURL: String) async {
        do {
            try await service.updateProfileImageURL(imageURL)
            self.currentUser?.profileImageUrl = imageURL
        } catch {
            print("DEBUG: Failed to update user profile image url with error: \(error)")
        }
    }
}

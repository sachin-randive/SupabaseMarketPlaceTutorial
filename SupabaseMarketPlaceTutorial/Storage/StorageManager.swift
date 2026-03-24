//
//  StorageManager.swift
//  SupabaseMarketPlaceTutorial
//
//  Created by Sachin Randive on 20/03/26.
//

import Foundation
import Supabase

struct StorageManager {
    
    private let client: SupabaseClient
    
    init() {
        self.client = SupabaseClient.init(
            supabaseURL: URL(string: Constants.projectURLSring)!,
            supabaseKey: Constants.projectAPIKey
        )
    }
    
    func uploadProfilePhoto(for user: User, imageData: Data) async throws -> String {
        let path = "\(user.id)/avatar.jpg"
        
        let fullPath = try await client.storage
            .from("avatars")
            .upload(path, data: imageData)
            .path
        
        print("DEBUG: Full path is \(fullPath)")
        
        let publicURL = "\(Constants.projectURLSring)/storage/v1/object/public/avatars/\(path)"
        return publicURL
    }
    
}


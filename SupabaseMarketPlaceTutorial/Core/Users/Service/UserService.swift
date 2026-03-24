//
//  UserService.swift
//  SupabaseMarketPlaceTutorial
//
//  Created by Sachin Randive on 19/03/26.
//

import Foundation
import Supabase

struct UserService {
    private let client: SupabaseClient
    
    init() {
        self.client = SupabaseClient.init(
            supabaseURL: URL(string: Constants.projectURLSring)!,
            supabaseKey: Constants.projectAPIKey,
            options: SupabaseClientOptions(
                    auth: .init(
                        emitLocalSessionAsInitialSession: true
                    )
                )
        )
    }
    
    func fetchCurrentUser() async throws -> User {
        let supabaseUser = try await client.auth.session.user
        
        return try await client.from("users")
            .select()
            .eq("id", value: supabaseUser.id.uuidString)
            .single()
            .execute()
            .value
    }
    
    func updateProfileImageURL(_ imageURL: String) async throws {
        let uid = try await client.auth.session.user.id.uuidString
        
        try await client
            .from("users")
            .update(["profile_image_url": imageURL])
            .eq("id", value: uid)
            .execute()
    }
}

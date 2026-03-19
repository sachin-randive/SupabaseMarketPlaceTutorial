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
            supabaseKey: Constants.projectAPIKey
        )
    }
    
    func fetchCurrentUser() async throws -> User {
        let supabaseUser = try await client.auth.session.user
        
        return try await client.from("Users")
            .select()
            .eq("id", value: supabaseUser.id.uuidString)
            .single()
            .execute()
            .value
    }
}

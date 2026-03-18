//
//  SupabaseAuthService.swift
//  SupabaseMarketPlaceTutorial
//
//  Created by Sachin Randive on 18/03/26.
//

import Foundation
import Supabase

struct SupabaseAuthService {
    private let client: SupabaseClient
    
    init() {
        self.client = SupabaseClient.init(
            supabaseURL: URL(string: Constants.projectURLSring)!,
            supabaseKey: Constants.projectAPIKey
        )
    }
    
    func signIn(email: String, pasword: String) async throws -> String {
        let response = try await client.auth.signIn(email: email, password: pasword)
        return response.user.id.uuidString
    }
    
    func signUp(email: String, pasword: String, username: String) async throws -> String {
        let response = try await client.auth.signUp(email: email, password: pasword)
        let userId = response.user.id.uuidString
        // upload user data here....
        return userId
    }
    
    func signOut() async throws {
        try await client.auth.signOut()
    }
    
    func getCurrentUserSession() async throws -> String? {
        let supabaseUser = try await client.auth.session.user
        return supabaseUser.id.uuidString
    }
}

//
//  AuthManager.swift
//  SupabaseMarketPlaceTutorial
//
//  Created by Sachin Randive on 18/03/26.
//

import Foundation

@Observable
final class AuthManager {
    var authState: AuthState = .unknown
    var currentUserId: String?
    
    private let authService: SupabaseAuthService
    
    init(authService: SupabaseAuthService = SupabaseAuthService()) {
        self.authService = authService
    }
    
    func signIn(email: String, password: String) async {
        do {
            currentUserId = try await authService.signIn(email: email, pasword: password)
            authState = .authenticated
            print("DEBUG: Auth state \(authState)")
            
        } catch {
            print("Sign-in error: \(error)")
        }
    }
    
    
    func signUp(email: String, password: String, username: String) async {
        do {
            currentUserId = try await authService.signUp(email: email, pasword: password, username: username)
            authState = .authenticated
            print("DEBUG: Auth state \(authState)")
            
        } catch {
            print("Sign-up error: \(error)")
        }
    }
    
    func signOut() async {
        do {
            try await authService.signOut()
            currentUserId = nil
            authState = .unauthenticated
        } catch {
            print("sign-out error: \(error)")
        }
    }
    
    func refreshUser() async {
        do {
            let userSessionID = try await authService.getCurrentUserSession()
            
            if let userSessionID {
                self.authState = .authenticated
                self.currentUserId = userSessionID
            }
        } catch {
            print("refresh user error: \(error)")
            currentUserId = nil
            authState = .unauthenticated
        }
    }
}

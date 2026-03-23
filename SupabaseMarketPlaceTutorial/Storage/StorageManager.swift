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
    
}


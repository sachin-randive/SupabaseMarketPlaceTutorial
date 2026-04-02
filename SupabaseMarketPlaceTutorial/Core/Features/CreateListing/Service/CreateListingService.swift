//
//  CreateListingService.swift
//  SupabaseMarketPlaceTutorial
//
//  Created by Sachin Randive on 30/03/26.
//

import Foundation
import Supabase

struct CreateListingService {
    private let client: SupabaseClient
    
    init() {
        self.client = SupabaseClient.init(
            supabaseURL: URL(string: Constants.projectURLSring)!,
            supabaseKey: Constants.projectAPIKey
        )
    }
    
    func createListing(
        title: String,
        description: String,
        price: Double,
        category: Listing.Category,
        imageData: [Data],
        seller:User
    ) async throws {
        
        var listing: Listing = Listing(
            id: UUID().uuidString,
            title: title,
            description: description,
            price: price,
            imageUrls: [],
            category: category,
            createdAt: Date(),
            likesCount: 0,
            status: .active,
            isFavorite: false,
            sellerID: seller.id,
            sellerName: seller.username,
            sellerProfileImageUrl: seller.profileImageUrl ?? ""
        )
        
    }
    
    private func uploadImage(for listing:Listing, data: [Data]) async throws -> [String] {
        let manager = StorageManager()
        var result = [String]()
        for data in data {
            let url = try await manager.uploadProfilePhoto(for: listing, imageData: data)
            result.append(url)
        }
        return result
    }
}

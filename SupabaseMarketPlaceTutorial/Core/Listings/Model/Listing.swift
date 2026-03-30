//
//  Listing.swift
//  SupabaseMarketPlaceTutorial
//
//  Created by Sachin Randive on 26/03/26.
//

import Foundation

struct Listing: Identifiable, Codable,Hashable {
    let id: String
    var title: String
    var description: String
    var price: Double
    var imageUrls: [String]
    var category: Category
    let createdAt: Date
    let likesCount: Int
    var status: Status
    var isFavorite: Bool
    
    var sellerID: String
    var sellerName: String
    var sellerProfileImageUrl: String
    
    var buyerID: String?
    var buyerName: String?
    var buyerProfileImageUrl: String?
    var purchasedAt: Date?
    
    enum Category: String, Codable, Identifiable, CaseIterable {
        case electronics
        case fashion
        case home
        case sports
        case automotive
        case beauty
        case applications
        case other
        
        var id: String { rawValue }
        
        var displayName: String {
            switch self {
            case .electronics: return "Electronics"
            case .fashion: return "Fashion"
            case .home: return "Home"
            case .sports: return "Sports"
            case .automotive: return "Automotive"
            case .beauty: return "Beauty"
            case .applications: return "Applications"
            case .other: return "Other"
            }
        }
    }
    
    enum Status: String, Codable {
        case inactive
        case active
        case purchased
    }
    
    mutating func updateAsPurchasedBy(buyerId: String) {
        self.status = .purchased
        self.buyerID = buyerId
        self.purchasedAt = Date()
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case price
        case imageUrls = "image_urls"
        case category
        case createdAt = "created_at"
        case likesCount = "liked_count"
        case status
        case isFavorite = "is_favorite"
        
        case sellerID = "seller_id"
        case sellerName = "seller_name"
        case sellerProfileImageUrl = "seller_profile_image_url"
        
        case buyerID = "buyer_id"
        case buyerName = "buyer_name"
        case buyerProfileImageUrl = "buyer_profile_image_url"
        case purchasedAt = "purchased_at"
    }
}

extension Listing {
    static var mock: Listing =  Listing(
        id: UUID().uuidString,
        title: "Air Pods",
        description: "Brand new AirPods, never used. Got different head phones instead.Comes wirh case",
        price: Double(Int.random(in: 100...500)),
        imageUrls: ["runnig-shoes"],
        category: .electronics,
        createdAt: Date(),
        likesCount: 4,
        status: .active,
        isFavorite: false,
        sellerID: UUID().uuidString,
        sellerName: "Sam Smith",
        sellerProfileImageUrl: "https://picsum.photos/100/100"
    )
}

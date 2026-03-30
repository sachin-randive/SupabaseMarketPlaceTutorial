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
    
    static var mocks: [Listing] = [
        Listing(
            id: UUID().uuidString,
            title: "Air Pods",
            description: "Brand new AirPods, never used.",
            price: 299,
            imageUrls: ["runnig-shoes"],
            category: .electronics,
            createdAt: Date(),
            likesCount: 4,
            status: .active,
            isFavorite: false,
            sellerID: UUID().uuidString,
            sellerName: "Sam Smith",
            sellerProfileImageUrl: "https://picsum.photos/100/100"
        ),
        Listing(
            id: UUID().uuidString,
            title: "iPhone 13",
            description: "Good condition, minor scratches.",
            price: 450,
            imageUrls: ["iphone"],
            category: .electronics,
            createdAt: Date(),
            likesCount: 10,
            status: .active,
            isFavorite: true,
            sellerID: UUID().uuidString,
            sellerName: "John Doe",
            sellerProfileImageUrl: "https://picsum.photos/101/100"
        ),
        Listing(
            id: UUID().uuidString,
            title: "Running Shoes",
            description: "Nike shoes, barely used.",
            price: 120,
            imageUrls: ["running-shoes"],
            category: .fashion,
            createdAt: Date(),
            likesCount: 6,
            status: .active,
            isFavorite: false,
            sellerID: UUID().uuidString,
            sellerName: "Alice",
            sellerProfileImageUrl: "https://picsum.photos/102/100"
        ),
        Listing(
            id: UUID().uuidString,
            title: "Office Chair",
            description: "Ergonomic chair, very comfortable.",
            price: 200,
            imageUrls: ["chair"],
            category: .home,
            createdAt: Date(),
            likesCount: 2,
            status: .active,
            isFavorite: false,
            sellerID: UUID().uuidString,
            sellerName: "Bob",
            sellerProfileImageUrl: "https://picsum.photos/103/100"
        ),
        Listing(
            id: UUID().uuidString,
            title: "Gaming Laptop",
            description: "High performance laptop.",
            price: 900,
            imageUrls: ["laptop"],
            category: .electronics,
            createdAt: Date(),
            likesCount: 15,
            status: .active,
            isFavorite: true,
            sellerID: UUID().uuidString,
            sellerName: "Chris",
            sellerProfileImageUrl: "https://picsum.photos/104/100"
        )
    ]
    
}

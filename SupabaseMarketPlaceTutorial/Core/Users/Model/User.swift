//
//  User.swift
//  SupabaseMarketPlaceTutorial
//
//  Created by Sachin Randive on 19/03/26.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let email: String
    let username: String
    let createdAt: Date
    var profileImageUrl: String? = nil
    var totalSales: Double
    var itemsSold: Int
    var itemsPurchased: Int
    
    private enum CodingKeys: String, CodingKey {
        case id
        case email
        case username
        case createdAt = "created_at"
        case profileImageUrl = "profile_image_url"
        case totalSales = "total_sales"
        case itemsSold = "items_sold_count"
        case itemsPurchased = "items_purchased_count"
    }
}

extension User {
    static var mock = User(
        id: UUID().uuidString,
        email: "Test@gmail.com",
        username: "test_user",
        createdAt: Date(),
        profileImageUrl: "https://picsum.photos/id/237/200/200",
        totalSales: 0,
        itemsSold: 0,
        itemsPurchased: 0
    )
}

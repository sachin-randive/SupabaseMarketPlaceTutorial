//
//  AvatarSize.swift
//  SupabaseMarketPlaceTutorial
//
//  Created by Sachin Randive on 23/03/26.
//

import Foundation

enum AvatarSize  {
    // An Avatar Size of 40*40
    case xSmall
    
    // An Avatar Size of 48*48
    case small
    
    // An Avatar Size of 60*60
    case medium
    
    // An Avatar Size of 80*80
    case large
    
    // An Avatar Size of 96*96
    case xLarge
    
    var dimension: CFloat {
        switch self {
        case .xSmall:
            return 40
        case .small:
            return 48
        case .medium:
            return 60
        case .large:
            return 80
        case .xLarge:
            return 96
        }
    }
}


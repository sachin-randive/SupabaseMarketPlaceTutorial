//
//  AvatarView.swift
//  SupabaseMarketPlaceTutorial
//
//  Created by Sachin Randive on 23/03/26.
//

import SwiftUI
import Kingfisher

struct AvatarView: View {
    private let imageUrl: String?
    private let profileImage: Image?
    private let onTap: (() -> Void)?
    private let size: AvatarSize
    
    init(imageUrl: String?, profileImage: Image?, size: AvatarSize, onTap: (() -> Void)?) {
        self.imageUrl = imageUrl
        self.profileImage = profileImage
        self.size = size
        self.onTap = onTap
    }
    
    var body: some View {
        Group {
            if let profileImage {
                profileImage
                    .resizable()
                    .scaledToFill()
                    .frame(width: CGFloat(size.dimension), height: CGFloat(size.dimension))
                    .clipShape(.circle)
            } else if let imageUrl {
                KFImage(URL(string: imageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: CGFloat(size.dimension), height: CGFloat(size.dimension))
                    .clipShape(.circle)
            } else {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: CGFloat(size.dimension), height: CGFloat(size.dimension))
                    .clipShape(.circle)
                    .foregroundStyle(.secondary)
            }
        }
        .onTapGesture {
            if let onTap {  }
        }
    }
}

#Preview {
    AvatarView(imageUrl: nil, profileImage: nil, size: .medium, onTap: nil)
}

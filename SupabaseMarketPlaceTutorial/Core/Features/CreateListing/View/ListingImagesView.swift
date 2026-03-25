//
//  ListingImagesView.swift
//  SupabaseMarketPlaceTutorial
//
//  Created by Sachin Randive on 25/03/26.
//

import SwiftUI
import PhotosUI

struct ListingImagesView: View {
    @Binding var pickedPhotoItems: [PhotosPickerItem]
    @Binding var selectedImages: [UIImage]
    
    var body: some View {
        VStack(spacing: 12) {
            PhotosPicker(selection: $pickedPhotoItems, maxSelectionCount: 5, matching: .images) {
                Label("Add Photos", systemImage: "photo.on.rectangle")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            if !pickedPhotoItems.isEmpty {
                
            }
        }
    }
}

#Preview {
    ListingImagesView(pickedPhotoItems: .constant([]), selectedImages: .constant([]))
}

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
            .task(id: pickedPhotoItems) {
                await onPhotoSelected()
            }
            
            if !pickedPhotoItems.isEmpty {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(Array(selectedImages.enumerated()), id: \.offset) {index, image in
                            ZStack(alignment: .topTrailing) {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 80, height: 80)
                                    .clipped()
                                    .cornerRadius(8)
                                
                                Button {
                                    selectedImages.remove(at: index)
                                }label: {
                                   Image(systemName: "xmark.circle.fill")
                                        .foregroundStyle(.white, .red)
                                }
                                .offset(x: 6, y: -6)
                            }
                            .padding(.vertical, 6)
                        }
                    }
                }
                .frame(height: 100)
            }
        }
    }
}

private extension ListingImagesView {
    func onPhotoSelected() async {
        var newImages: [UIImage] = []
        
        for item in pickedPhotoItems {
            guard let data = try? await item.loadTransferable(type: Data.self) else { return }
            
            guard let image = UIImage(data: data) else { return }
            newImages.append(image)
        }
        selectedImages = newImages
    }
}

#Preview {
    @Previewable @State var pickePhotoItems = [PhotosPickerItem]()
    @Previewable @State var selectedImages = [UIImage]()
    
    ListingImagesView(pickedPhotoItems: $pickePhotoItems, selectedImages: $selectedImages)
}

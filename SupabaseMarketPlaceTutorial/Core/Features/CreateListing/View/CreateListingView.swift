//
//  CreateListingView.swift
//  SupabaseMarketPlaceTutorial
//
//  Created by Sachin Randive on 25/03/26.
//

import SwiftUI

struct CreateListingView: View {
    @State private var title: String = ""
    @State private var price: String = ""
    @State private var description: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Details") {
                    TextField("Title", text: $title)
                    
                    TextField("Price", text: $price)
                        .keyboardType(.decimalPad)
                }
                
                Section("Description") {
                   TextEditor(text: $description)
                        .frame(height: 120)
                        .overlay(alignment: .topLeading) {
                            Group {
                                if description.isEmpty {
                                    Text("Describe your listing...")
                                        .foregroundStyle(.secondary)
                                        .padding(.top, 8)
                                        .padding(.leading, 4)
                                }
                            }
                        }
                }
                
                Section("Photos") {
                    
                }
                //TODO: Listing Category Picker
            }
            .navigationTitle("New Listing")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Post") {
                        
                    }
                }
            } // toolbar
        }
    }
}

#Preview {
    CreateListingView()
}

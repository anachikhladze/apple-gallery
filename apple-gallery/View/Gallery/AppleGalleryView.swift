//
//  AppleGalleryView.swift
//  apple-gallery
//
//  Created by Anna Sumire on 27.02.24.
//

import SwiftUI
import NetworkManager

struct AppleGalleryView: View {
    
    // MARK: - Properties
    @StateObject var viewModel: AppleGalleryViewModel
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            ScrollView {
                galleryGrid
            }
        }
    }
    
    // MARK: - CinemaGrid
    private var galleryGrid: some View {
        NavigationStack {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(viewModel.results) { item in
                    NavigationLink(value: item, label: {
                        AppleGalleryCardView(appleItem: item)
                    })
                    .padding(.bottom, 10)
                }
            }
            .navigationTitle("Apple Gallery")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: AppleItem.self) { item in
                AppleDetailsView(appleItem: item)
            }
        }
    }
}

// MARK: - #Preview
#Preview {
    AppleGalleryView(viewModel: AppleGalleryViewModel(networkManager: NetworkManager()))
}

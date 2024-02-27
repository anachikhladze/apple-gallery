//
//  AppleGalleryCardView.swift
//  apple-gallery
//
//  Created by Anna Sumire on 27.02.24.
//

import SwiftUI
import Kingfisher

struct AppleGalleryCardView: View {
    
    var appleItem: AppleItem
    
    // MARK: - Body
    var body: some View {
        mainVStack
    }
    
    private var mainVStack: some View {
        VStack(alignment: .center) {
            appleImage
            infoVStack
        }
        .frame(maxWidth: 140)
        .padding(EdgeInsets(top: 20, leading: 15, bottom: 15, trailing: 15))
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: .gray, radius: 6, x: 0, y: 6)
    }
    
    private var appleImage: some View {
        KFImage(URL(string: appleItem.largeImageURL))
            .resizable()
            .scaledToFill()
            .frame(maxWidth: 120, maxHeight: 150)
    }
    
    
    private var infoVStack: some View {
        VStack {
            Text(appleItem.user)
                .foregroundColor(Color.primary)
                .font(.headline)
                .padding(.top, 10)
                .lineLimit(1)
            
            Text("Likes: \(String(18)) ⭐️")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}


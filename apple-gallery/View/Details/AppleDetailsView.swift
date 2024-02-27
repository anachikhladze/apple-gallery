//
//  AppleDetailsView.swift
//  apple-gallery
//
//  Created by Anna Sumire on 27.02.24.
//

import SwiftUI

struct AppleDetailsView: View {
    // MARK: - Properties
    var appleItem: AppleItem
    
    // MARK: - Body
    var body: some View {
        appleDetailsScrollView
    }
    
    private var appleDetailsScrollView: some View {
        ScrollView {
            mainVStack
        }
    }
    
    private var mainVStack: some View {
        VStack(alignment: .leading, spacing: 10) {
            appleAsyncImage
            imageDetailsCardView
            moreDetailsCardView
        }
        .padding()
    }
    
    private var appleAsyncImage: some View {
        AsyncImage(url: URL(string:
                                appleItem.largeImageURL)) { image in
            image
                .resizable()
                .scaledToFit()
            
        } placeholder: {
            ProgressView()
        }
        .frame(maxWidth: .infinity, maxHeight: 370)
        .cornerRadius(10)
        .shadow(radius: 10)
    }
    
    private var imageDetailsText: some View {
        HStack {
            Text("Image Details:")
                .font(.system(size: 24, weight: .black, design: .rounded))
        }
    }
    
    private var imageDetailsVStack: some View {
        VStack(alignment: .leading, spacing: 5) {
            imageDetailsText
            DetailView(symbolName: "photo.on.rectangle", detailText: "Image Size: \(appleItem.imageSize)")
            DetailView(symbolName: "doc.text", detailText: "Image Type: \(appleItem.type.rawValue)")
            DetailView(symbolName: "tag", detailText: "Tags: \(appleItem.tags)")
        }
        .font(.system(size: 20, weight: .light, design: .rounded))
    }
    
    private var moreDetailsVStack: some View {
        VStack(alignment: .leading, spacing: 5) {
            DetailView(symbolName: "person", detailText: "Username: \(appleItem.user)")
            DetailView(symbolName: "eye", detailText: "Views: \(appleItem.views)")
            DetailView(symbolName: "heart", detailText: "Likes: \(appleItem.likes)")
            DetailView(symbolName: "bubble.right", detailText: "Comments: \(appleItem.comments)")
            DetailView(symbolName: "star", detailText: "Favorites: \(appleItem.collections)")
            DetailView(symbolName: "arrow.down.circle", detailText: "Downloads: \(appleItem.downloads)")
        }
        .cornerRadius(10)
    }
    
    
    private var imageDetailsCardView: some View {
        ZStack(alignment: .leading) {
            cardViewBackground
            VStack(alignment: .leading) {
                imageDetailsVStack
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: 200)
        .cornerRadius(10)
    }
    
    private var moreDetailsCardView: some View {
        ZStack(alignment: .leading) {
            cardViewBackground
            VStack(alignment: .leading) {
                moreDetailsVStack
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: 200)
        .cornerRadius(10)
    }
    
    private var cardViewBackground: some View {
        Rectangle()
            .fill(LinearGradient(gradient: Gradient(colors: [Color.gray, Color.blue]), startPoint: .topTrailing, endPoint: .bottomTrailing))
            .opacity(0.5)
    }
}

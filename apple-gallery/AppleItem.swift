//
//  AppleGallery.swift
//  apple-gallery
//
//  Created by Anna Sumire on 27.02.24.
//

import Foundation

// MARK: - AppleGalleryResponse
struct AppleGalleryResponse: Decodable {
    let hits: [AppleItem]
}

// MARK: - AppleItem
struct AppleItem: Decodable, Identifiable, Hashable {
    let id: Int
    let type: TypeEnum
    let tags: String
    let largeImageURL: String
    let imageSize: Int
    let views: Int
    let downloads: Int
    let collections: Int
    let likes: Int
    let comments: Int
    let user: String
    
    enum CodingKeys: String, CodingKey {
        case id, type, tags, largeImageURL, imageSize, views, downloads, collections, likes, comments
        case user
    }
}

enum TypeEnum: String, Codable {
    case photo = "photo"
}

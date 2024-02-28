//
//  AppleGallerySwiftUIView.swift
//  apple-gallery
//
//  Created by Anna Sumire on 28.02.24.
//

import SwiftUI
import NetworkManager

struct AppleGallerySwiftUIView: UIViewControllerRepresentable {
    typealias UIViewControllerType = AppleGalleryViewController
    
    func makeUIViewController(context: Context) -> AppleGalleryViewController {
        return AppleGalleryViewController(viewModel: GalleryViewModel(networkManager: NetworkManager()))
    }
    
    func updateUIViewController(_ uiViewController: AppleGalleryViewController, context: Context) {
        // ...
    }
}

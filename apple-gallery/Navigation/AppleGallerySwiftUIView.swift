//
//  AppleGallerySwiftUIView.swift
//  apple-gallery
//
//  Created by Anna Sumire on 28.02.24.
//

import SwiftUI
import NetworkManager

struct AppleGallerySwiftUIView: UIViewControllerRepresentable {
    typealias UIViewControllerType = UINavigationController

    func makeUIViewController(context: Context) -> UINavigationController {
        let galleryViewController = AppleGalleryViewController(viewModel: GalleryViewModel(networkManager: NetworkManager()))
        let navigationController = UINavigationController(rootViewController: galleryViewController)
        return navigationController
    }

    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        
    }
}

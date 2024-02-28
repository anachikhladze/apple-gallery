//
//  AppleGallerySwiftUIView.swift
//  apple-gallery
//
//  Created by Anna Sumire on 28.02.24.
//

import SwiftUI
import NetworkManager

struct AppleGallerySwiftUIView: UIViewControllerRepresentable {
    typealias UIViewControllerType = AppleDetailsViewController
    
    func makeUIViewController(context: Context) -> AppleDetailsViewController {
        return AppleDetailsViewController()
    }
    
    func updateUIViewController(_ uiViewController: AppleDetailsViewController, context: Context) {
        // ...
    }
}

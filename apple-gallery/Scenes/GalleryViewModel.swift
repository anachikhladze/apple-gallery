//
//  AppleGalleryViewModel1.swift
//  apple-gallery
//
//  Created by Anna Sumire on 28.02.24.
//

import SwiftUI
import NetworkManager

protocol GalleryViewModelDelegate: AnyObject {
    func didFetchData()
}

final class GalleryViewModel: ObservableObject {
    
    // MARK: - Properties
    let networkManager: APIServices
    weak var delegate: GalleryViewModelDelegate?
    @Published var results: [AppleItem] = []
    
    // MARK: - Initialization
    init(networkManager: APIServices) {
        self.networkManager = networkManager
        Task {
            await fetchGalleryData()
        }
    }
    
    // MARK: - Private Methods
    private func fetchGalleryData() async {
        let urlString = "https://pixabay.com/api/?key=\(Constants.apiKey)&q=apple&image_type=photo&per_page=40"
        do {
            let appleGalleryResponse: AppleGalleryResponse = try await networkManager.fetchData(fromURL: urlString)
            await MainActor.run {
                results = appleGalleryResponse.hits
                delegate?.didFetchData()
            }
        } catch {
            print(error)
        }
    }
}

//
//  AppleGalleryViewModel1.swift
//  apple-gallery
//
//  Created by Anna Sumire on 28.02.24.
//

import SwiftUI
import NetworkManager

protocol AppleGalleryViewModelDelegate: AnyObject {
    func didFetchData()
}

final class AppleGalleryViewModel: ObservableObject {
    
    // MARK: - Properties
    let networkManager: APIServices
    weak var delegate: AppleGalleryViewModelDelegate?
    
    var results: [AppleItem] = []
    
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

struct Constants {
    static let apiKey = "42579446-bbc2e8726461b1faa8a164b23"
}

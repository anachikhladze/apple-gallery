//
//  AppleDetailsViewController.swift
//  apple-gallery
//
//  Created by Anna Sumire on 28.02.24.
//

import UIKit

final class AppleDetailsViewController: UIViewController {
    
    // MARK: - Properties
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let appleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 32
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        return stackView
    }()
    
    private let infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let imageSizeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private let imageTypeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private let imageTagsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private let viewsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private let likesLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private let commentsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private let favoritesLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private let downloadsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Configure
    func configure(with item: AppleItem) {
        let url = URL(string: item.largeImageURL)
        appleImageView.kf.setImage(with: url)
        
        imageSizeLabel.text = "Size: \(item.imageSize)"
        imageTypeLabel.text = "Image type \(item.type)"
        imageTagsLabel.text = "Image tags: \(item.tags)"
        usernameLabel.text = "Username: \(item.user)"
        viewsLabel.text = "Image views: \(item.views)"
        likesLabel.text = "Image likes: \(item.likes)"
        commentsLabel.text = "Image comments: \(item.comments)"
        favoritesLabel.text = "Image favorites: \(item.collections)"
        downloadsLabel.text = "Image downloads: \(item.downloads)"
    }
    
    // MARK: - Private Methods
    private func setup() {
        setupBackground()
        setupNavigationBar()
        addSubviews()
        setupConstraints()
    }
    
    private func setupBackground() {
        view.backgroundColor = .systemBackground
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Details"
    }
    
    private func addSubviews() {
        addMainSubview()
        setupInfoStackViews()
    }
    
    private func addMainSubview() {
        view.addSubview(scrollView)
        scrollView.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(appleImageView)
        mainStackView.addArrangedSubview(infoStackView)
    }
    
    private func setupInfoStackViews() {
        let imageInfo = InfoStackViewComponent(title: "Image Details:", items: [imageSizeLabel, imageTypeLabel, imageTagsLabel], symbolName: "photo.on.rectangle")
        
        let activityInfo = InfoStackViewComponent(title: "Activity:", items: [usernameLabel, viewsLabel, likesLabel, commentsLabel, favoritesLabel, downloadsLabel], symbolName: "eye")
        
        infoStackView.addArrangedSubview(imageInfo)
        infoStackView.addArrangedSubview(activityInfo)
    }
    
    private func setupConstraints() {
        setupMainViewConstraints()
        customizeStackViewSpacing()
    }
    
    private func setupMainViewConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            appleImageView.heightAnchor.constraint(equalToConstant: 200),
            appleImageView.widthAnchor.constraint(equalToConstant: 150),
            
            mainStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            mainStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    private func customizeStackViewSpacing() {
        mainStackView.setCustomSpacing(32, after: mainStackView.subviews[0])
        mainStackView.setCustomSpacing(32, after: mainStackView.subviews[1])
    }
}

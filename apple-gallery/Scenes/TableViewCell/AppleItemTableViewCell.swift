//
//  AppleItemTableViewCell.swift
//  apple-gallery
//
//  Created by Anna Sumire on 28.02.24.
//

import UIKit
import Kingfisher

final class AppleItemTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 8
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = .init(top: 8, left: 16, bottom: 8, right: 16)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    
    private let appleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica-Bold", size: 18)
        label.textColor = .black
        return label
    }()
    
    private let likesCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica-Bold", size: 18)
        label.textColor = .black
        return label
    }()

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        addSubviews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - PrepareForReuse
    override func prepareForReuse() {
        super.prepareForReuse()
        
        appleImageView.image = nil
        usernameLabel.text = nil
        likesCountLabel.text = nil
    }
    
    // MARK: - Configure
    func configure(with item: AppleItem) {
        
        let url = URL(string: item.largeImageURL)
        appleImageView.kf.setImage(with: url)
        
        let usernameIcon = NSTextAttachment()
        usernameIcon.image = UIImage(systemName: "person")?.withTintColor(.black, renderingMode: .automatic)
        let usernameIconString = NSAttributedString(attachment: usernameIcon)
        let usernameText = NSMutableAttributedString(string: "Username: \(item.user)")
        usernameText.insert(usernameIconString, at: 0)
        usernameLabel.attributedText = usernameText
        
        let likesIcon = NSTextAttachment()
        likesIcon.image = UIImage(systemName: "heart")?.withTintColor(.black, renderingMode: .automatic)
        let likesString = NSAttributedString(attachment: likesIcon)
        let likesText = NSMutableAttributedString(string: "Likes:  \(item.likes)")
        likesText.insert(likesString, at: 0)
        likesCountLabel.attributedText = likesText
    }

    // MARK: - Private Methods
    private func addSubviews() {
        addSubview(mainStackView)
        mainStackView.addArrangedSubview(appleImageView)
        
        infoStackView.addArrangedSubview(usernameLabel)
        infoStackView.addArrangedSubview(likesCountLabel)
        
        mainStackView.addArrangedSubview(infoStackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: self.topAnchor),
            mainStackView.leftAnchor.constraint(equalTo: self.leftAnchor),
            mainStackView.rightAnchor.constraint(equalTo: self.rightAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            appleImageView.widthAnchor.constraint(equalToConstant: 90),
            appleImageView.heightAnchor.constraint(equalToConstant: 90),
        ])
    }
}

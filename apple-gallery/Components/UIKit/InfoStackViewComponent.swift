//
//  InfoStackViewComponent.swift
//  apple-gallery
//
//  Created by Anna Sumire on 28.02.24.
//

import UIKit

final class InfoStackViewComponent: UIStackView {
    
    private let gradientLayer = CAGradientLayer()
    
    init(title: String, items: [UILabel], symbolName: String) {
        super.init(frame: .zero)
        
        axis = .vertical
        spacing = 8
        isLayoutMarginsRelativeArrangement = true
        layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        layer.cornerRadius = 8
        
        gradientLayer.colors = [UIColor.blue.cgColor, UIColor.accentColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 1, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        gradientLayer.opacity = 0.5
        gradientLayer.cornerRadius = 14
        layer.insertSublayer(gradientLayer, at: 0)
        
        setup(title: title, items: items, symbolName: symbolName)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    private func setup(title: String, items: [UILabel], symbolName: String) {
        let titleLabel = UILabel()
        let config = UIImage.SymbolConfiguration(paletteColors: [UIColor.font])
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 22, weight: .medium).applying(config)
        let image = UIImage(systemName: symbolName, withConfiguration: symbolConfig)
        let attachment = NSTextAttachment()
        attachment.image = image
        let attributedString = NSMutableAttributedString(attachment: attachment)
        attributedString.append(NSAttributedString(string: " \(title)"))
        titleLabel.attributedText = attributedString
        titleLabel.textColor = UIColor.font
        titleLabel.font = UIFont.customRoundedFont(size: 22, weight: .medium)
        titleLabel.textAlignment = .left
        addArrangedSubview(titleLabel)
        
        for item in items {
            var itemLabel = UILabel()
            itemLabel = item
            itemLabel.numberOfLines = 0
            itemLabel.textColor = UIColor.font
            itemLabel.textAlignment = .left
            itemLabel.font = UIFont.customRoundedFont(size: 20, weight: .light)
            addArrangedSubview(itemLabel)
        }
    }
}


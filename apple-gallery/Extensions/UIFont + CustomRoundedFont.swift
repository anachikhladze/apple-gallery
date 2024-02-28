//
//  UIFont + CustomRoundedFont.swift
//  apple-gallery
//
//  Created by Anna Sumire on 28.02.24.
//

import UIKit

extension UIFont {
    static func customRoundedFont(size: CGFloat, weight: UIFont.Weight) -> UIFont {
        if let descriptor = UIFont.systemFont(ofSize: size, weight: weight).fontDescriptor.withDesign(.rounded) {
            return UIFont(descriptor: descriptor, size: size)
        } else {
            return UIFont.systemFont(ofSize: size, weight: weight)
        }
    }
}

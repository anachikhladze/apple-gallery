//
//  DetailView.swift
//  apple-gallery
//
//  Created by Anna Sumire on 27.02.24.
//

import SwiftUI

struct DetailView: View {
    var symbolName: String
    var detailText: String

    var body: some View {
        HStack {
            Image(systemName: symbolName)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
            Text(detailText)
                .font(.system(size: 20, weight: .light, design: .rounded))
        }
    }
}

//
//  SignInCustomButton.swift
//  apple-gallery
//
//  Created by Anna Sumire on 27.02.24.
//

import SwiftUI

struct SignInCustomButton: View {
    
    // MARK: - Properties
    var label: String
    var action: () -> Void
    
    // MARK: - Body
    var body: some View {
        Button {
           action()
        } label: {
            HStack {
                Text(label)
                    .fontWeight(.semibold)
                Image(systemName: "arrow.right")
            }
            .foregroundStyle(.white)
            .frame(width: UIScreen.main.bounds.width - 32, height: 48)
        }
        .background(Color(.blue))
        .cornerRadius(10)
        .padding(.top, 24)
    }
}


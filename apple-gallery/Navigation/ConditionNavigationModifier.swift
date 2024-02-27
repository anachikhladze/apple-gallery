//
//  ConditionNavigationModifier.swift
//  apple-gallery
//
//  Created by Anna Sumire on 27.02.24.
//

import SwiftUI

struct ConditionalNavigationModifier<Destination: View>: ViewModifier {
    @Binding var condition: Bool
    let destination: Destination

    func body(content: Content) -> some View {
        Group {
            if condition {
                NavigationView {
                    destination
                }
            } else {
                content
            }
        }
    }
}

extension View {
    func navigate<Destination: View>(when condition: Binding<Bool>, to destination: Destination) -> some View {
        self.modifier(ConditionalNavigationModifier(condition: condition, destination: destination))
    }
}

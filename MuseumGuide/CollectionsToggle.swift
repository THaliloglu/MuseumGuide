//
//  CollectionsToggle.swift
//  MuseumGuide
//
//  Created by TOLGA HALILOGLU on 13.06.2024.
//

import SwiftUI

/// A view that provides a navigation link to the CollectionsView.
struct CollectionsToggle: View {
    var body: some View {
        NavigationLink(destination: CollectionsView()) {
            Text("View Collections")
                .font(.callout)
                .padding()
                .foregroundStyle(.secondary)
                .cornerRadius(10)
                .accessibilityLabel("View Collections")
                .accessibilityHint("Navigates to the collections view where you can explore different museum collections.")
        }
        .glassBackgroundEffect()
        .buttonStyle(.borderless)
        .buttonBorderShape(.roundedRectangle(radius: 20))
        .padding()
    }
}

#Preview {
    CollectionsToggle()
}

//
//  CollectionsToggle.swift
//  MuseumGuide
//
//  Created by TOLGA HALILOGLU on 13.06.2024.
//

import SwiftUI

struct CollectionsToggle: View {
    var body: some View {
        NavigationLink(destination: CollectionsView()) {
            Text("View Collections")
                .font(.callout)
                .padding()
                .foregroundStyle(.secondary)
                .cornerRadius(10)
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

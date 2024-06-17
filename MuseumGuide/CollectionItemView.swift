//
//  CollectionItemView.swift
//  MuseumGuide
//
//  Created by TOLGA HALILOGLU on 2.06.2024.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct CollectionItemView: View {
    let item: CollectionItem
    
    var body: some View {
        VStack {
            Text(item.title)
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}

#Preview {
    let item = CollectionItem(title: "Aphrodite of Milos", description: "Detailed information about Aphrodite of Milos.", modelName: "aphrodite")
    return CollectionItemView(item: item)
}

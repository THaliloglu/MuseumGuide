//
//  CollectionItemView.swift
//  MuseumGuide
//
//  Created by TOLGA HALILOGLU on 2.06.2024.
//

import SwiftUI

/// A view to display detailed information about a specific collection item.
struct CollectionItemView: View {
    let item: CollectionItem
    
    var body: some View {
        VStack {
            // Display the title of the collection item
            Text(item.title)
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding()
            
            // Display the description of the collection item
            Text(item.description)
                .font(.body)
                .multilineTextAlignment(.leading)
                .padding([.leading, .trailing, .bottom])
        }
    }
}

#Preview {
    let item = CollectionItem(
        title: "Aphrodite of Milos",
        description: "Detailed information about Aphrodite of Milos.",
        modelName: "aphrodite"
    )
    return CollectionItemView(item: item)
}

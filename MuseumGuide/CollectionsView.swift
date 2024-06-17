//
//  CollectionsView.swift
//  MuseumGuide
//
//  Created by TOLGA HALILOGLU on 2.06.2024.
//

import SwiftUI

/// A view that displays a grid of collection items in the museum.
struct CollectionsView: View {
    
    @Environment(AppModel.self) private var appModel
    
    var body: some View {
        GeometryReader { geometry in
            let itemWidth = geometry.size.width * 0.25
            let itemHeight = itemWidth * 4 / 3
            let columns = Array(repeating: GridItem(.fixed(itemWidth), spacing: 40), count: 3)
            
            ZStack {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 40) {
                        ForEach(appModel.collectionItems) { item in
                            NavigationLink(destination: CollectionDetailView(item: item)) {
                                CollectionItemView(item: item)
                                    .frame(width: itemWidth, height: itemHeight)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(8)
                            }
                            .buttonBorderShape(.roundedRectangle)
                            .buttonStyle(.plain)
                        }
                    }
                    .padding()
                }
                .navigationTitle("Collections")
            }
        }
    }
}

#Preview {
    CollectionsView()
}

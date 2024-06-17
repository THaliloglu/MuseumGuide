//
//  CollectionDetailView.swift
//  MuseumGuide
//
//  Created by TOLGA HALILOGLU on 2.06.2024.
//

import SwiftUI
import RealityKit
import RealityKitContent

private let modelDepth: Double = 200

/// A view that displays detailed information about a specific collection item.
struct CollectionDetailView: View {
    @Environment(AppModel.self) private var appModel
    
    let item: CollectionItem
    
    var body: some View {
        GeometryReader { proxy in
            let textWidth = min(max(proxy.size.width * 0.4, 300), 500)
            let imageWidth = min(max(proxy.size.width - textWidth, 200), 500)
            
            HStack(spacing: 60) {
                itemDetails(textWidth: textWidth)
                ModelView(item: item)
                    .frame(width: imageWidth, alignment: .center)
                    .scaleEffect(0.8)
            }
            .offset(y: -30)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(70)
        }
    }
    
    /// A view displaying the title and description of the collection item.
    private func itemDetails(textWidth: CGFloat) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(item.title)
                .font(.system(size: 50, weight: .bold))
                .padding(.bottom, 15)
                .accessibilitySortPriority(4)
            
            Text(item.description)
                .padding(.bottom, 30)
                .accessibilitySortPriority(3)
            
            VolumeToggle(item: item)
        }
        .frame(width: textWidth, alignment: .leading)
    }
}

/// A toggle that activates or deactivates the globe volume.
struct VolumeToggle: View {
    @Environment(AppModel.self) private var appModel
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow

    var item: CollectionItem
    
    var body: some View {
        @Bindable var appModel = appModel

        Toggle("See More", isOn: $appModel.isShowingVolume)
            .onChange(of: appModel.isShowingVolume) { _, isShowing in
                if isShowing {
                    openWindow(id: "volumes", value: item)
                } else {
                    dismissWindow(id: "volumes")
                    openWindow(id: "volumes", value: item)
                }
            }
            .toggleStyle(.button)
    }
}

/// A view for displaying a 3D model of the collection item.
struct ModelView: View {
    let item: CollectionItem
    var orientation: SIMD3<Double> = .zero

    var body: some View {
        Model3D(named: item.modelName, bundle: realityKitContentBundle) { model in
            model.resizable()
                .scaledToFit()
                .rotation3DEffect(
                    Rotation3D(eulerAngles: .init(angles: orientation, order: .xyz))
                )
                .frame(depth: modelDepth)
                .offset(z: -modelDepth / 2)
                .accessibilitySortPriority(1)
        } placeholder: {
            ProgressView()
                .offset(z: -modelDepth * 0.75)
        }
    }
}

#Preview {
    let item = CollectionItem(
        title: "Aphrodite of Milos",
        description: "Detailed information about Aphrodite of Milos.",
        modelName: "aphrodite"
    )
    return CollectionDetailView(item: item)
        .environment(AppModel())
}

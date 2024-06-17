//
//  CollectionVolumeView.swift
//  MuseumGuide
//
//  Created by TOLGA HALILOGLU on 6.06.2024.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct CollectionVolumeView: View {
    @Environment(AppModel.self) private var appModel
    
    let item: CollectionItem
    
    @State var axRotateClockwise: Bool = false
    @State var axRotateCounterClockwise: Bool = false
    
    var body: some View {
        ZStack {
            Model3D(named: item.modelName, bundle: realityKitContentBundle) { model in
                model
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .dragRotation(
                pitchLimit: .degrees(170),
                axRotateClockwise: axRotateClockwise,
                axRotateCounterClockwise: axRotateCounterClockwise)
        }
        .onAppear {
            appModel.currentItem = item
        }
        .onDisappear{
            appModel.isShowingVolume = false
            appModel.currentItem = nil
        }
    }
}

#Preview {
    let item = CollectionItem(title: "Aphrodite of Milos", description: "Detailed information about Aphrodite of Milos.", modelName: "aphrodite")
    return CollectionVolumeView(item: item)
        .environment(AppModel())
}

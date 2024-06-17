//
//  MuseumGuideApp.swift
//  MuseumGuide
//
//  Created by TOLGA HALILOGLU on 30.05.2024.
//

import SwiftUI
import RealityKitContent

@main
struct MuseumGuideApp: App {
    
    @State private var appModel = AppModel()
    
    var body: some Scene {
        WindowGroup("Welcome View", id: "welcomeView") {
            WelcomeView()
                .environment(appModel)
        }
        .windowStyle(.plain)
        
        WindowGroup(id: "volumes", for: CollectionItem.self) { $collectionItem in
            if let item = collectionItem {
                CollectionVolumeView(item: item)
                    .environment(appModel)
            } else {
                Text("No item selected")
            }
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 0.6, height: 0.6, depth: 0.6, in: .meters)
        
        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
                .environment(appModel)
        }.immersionStyle(selection: .constant(.mixed), in: .mixed)
    }
    
    init() {
        PointOfInterestComponent.registerComponent()
        PointOfInterestRuntimeComponent.registerComponent()
    }
}

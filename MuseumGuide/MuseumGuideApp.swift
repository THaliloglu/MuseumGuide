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
                .accessibilityElement(children: .contain)
                .accessibilityLabel("Welcome View")
                .accessibilityHint("This is the welcome screen of the Museum Guide app.")
        }
        .windowStyle(.plain)
        
        WindowGroup(id: "volumes", for: CollectionItem.self) { $collectionItem in
            if let item = collectionItem {
                CollectionVolumeView(item: item)
                    .environment(appModel)
                    .accessibilityElement(children: .contain)
                    .accessibilityLabel("Collection Volume View")
                    .accessibilityHint("Displays detailed information about the selected collection item.")
            } else {
                Text("No item selected")
                    .accessibilityLabel("No item selected")
                    .accessibilityHint("No item has been selected from the collection.")
            }
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 0.6, height: 0.6, depth: 0.6, in: .meters)
        
        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
                .environment(appModel)
                .accessibilityElement(children: .contain)
                .accessibilityLabel("Immersive View")
                .accessibilityHint("Provides an immersive experience of the museum.")
        }.immersionStyle(selection: .constant(.mixed), in: .mixed)
    }
    
    init() {
        registerPointOfInterestComponents()
    }
    
    /// Registers the Point of Interest components used in the app.
    private func registerPointOfInterestComponents() {
        PointOfInterestComponent.registerComponent()
        PointOfInterestRuntimeComponent.registerComponent()
    }
}

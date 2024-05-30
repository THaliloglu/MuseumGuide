//
//  MuseumGuideApp.swift
//  MuseumGuide
//
//  Created by TOLGA HALILOGLU on 30.05.2024.
//

import SwiftUI

@main
struct MuseumGuideApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }.immersionStyle(selection: .constant(.progressive), in: .progressive)
    }
}

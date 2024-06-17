//
//  ImmersiveToggle.swift
//  MuseumGuide
//
//  Created by TOLGA HALILOGLU on 13.06.2024.
//

import SwiftUI

struct ImmersiveToggle: View {
    @Environment(AppModel.self) private var appModel
    
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace

    var body: some View {
        Button {
            Task {
                if appModel.isShowingImmersive {
                    await dismissImmersiveSpace()
                } else {
                    await openImmersiveSpace(id: "ImmersiveSpace")
                }
            }
        } label: {
            if appModel.isShowingImmersive {
                Label(
                    "Exit Immersive Space",
                    systemImage: "arrow.down.right.and.arrow.up.left")
                    .accessibilityLabel("Exit Immersive Space")
                    .accessibilityHint("Tap to exit the immersive space.")
            } else {
                Text("Show Immersive Space")
                    .accessibilityLabel("Show Immersive Space")
                    .accessibilityHint("Tap to enter the immersive space.")
            }
        }
        .glassBackgroundEffect()
        .buttonStyle(.borderless)
        .buttonBorderShape(.roundedRectangle(radius: 20))
        .padding()
    }
}

#Preview {
    ImmersiveToggle()
        .environment(AppModel())
}

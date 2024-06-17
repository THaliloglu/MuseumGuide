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
            } else {
                Text("Show Immersive Space")
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

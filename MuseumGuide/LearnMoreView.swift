//
//  LearnMoreView.swift
//  MuseumGuide
//
//  Created by TOLGA HALILOGLU on 15.06.2024.
//

import SwiftUI
import RealityKit
import RealityKitContent

/// A view that displays the name and description of a collection item with a toggle for more information.
public struct LearnMoreView: View {
    
    let name: String
    let description: String
    
    @State private var showingMoreInfo = false
    @Namespace private var animation
    
    private var titleFont: Font {
        .system(size: 36, weight: .semibold)
    }
    
    private var descriptionFont: Font {
        .system(size: 24, weight: .regular)
    }
    
    public var body: some View {
        VStack {
            Spacer()
            ZStack(alignment: .center) {
                if !showingMoreInfo {
                    Text(name)
                        .matchedGeometryEffect(id: "Name", in: animation)
                        .font(titleFont)
                        .padding()
                        .accessibilityElement(children: .combine)
                        .accessibilityLabel(name)
                        .accessibilityHint("Tap to see more information.")
                }
                
                if showingMoreInfo {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(name)
                            .matchedGeometryEffect(id: "Name", in: animation)
                            .font(titleFont)
                            .accessibilityAddTraits(.isHeader)
                        
                        Text(description)
                            .font(descriptionFont)
                            .accessibilityLabel(description)
                            .accessibilityHint("Description of \(name).")
                    }
                    .transition(.opacity)
                }
            }
            .frame(width: 408)
            .padding(24)
            .background(.white.opacity(0.2))
            .glassBackgroundEffect(in: .rect(cornerRadius: 25))
            .onTapGesture {
                withAnimation(.spring) {
                    showingMoreInfo.toggle()
                    UIAccessibility.post(notification: .announcement, argument: showingMoreInfo ? "Showing more information about \(name)." : "Hiding information about \(name).")
                }
            }
        }
    }
}

#Preview {
    RealityView { content, attachments in
        if let entity = attachments.entity(for: "z") {
            content.add(entity)
        }
    } attachments: {
        Attachment(id: "z") {
            LearnMoreView(
                name: "Phoenix Lake",
                description: "Lake · Northern California"
            )
        }
    }
}

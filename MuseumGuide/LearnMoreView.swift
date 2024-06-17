//
//  LearnMoreView.swift
//  MuseumGuide
//
//  Created by TOLGA HALILOGLU on 15.06.2024.
//

import SwiftUI
import RealityKit
import RealityKitContent

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
                }
                
                if showingMoreInfo {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(name)
                            .matchedGeometryEffect(id: "Name", in: animation)
                            .font(titleFont)
                        
                        Text(description)
                            .font(descriptionFont)
                    }
                }
            }
            .frame(width: 408)
            .padding(24)
            .background(.white.opacity(0.2))
            .glassBackgroundEffect(in: .rect(cornerRadius: 25))
            .onTapGesture {
                withAnimation(.spring) {
                    showingMoreInfo.toggle()
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
            LearnMoreView(name: "Phoenix Lake",
                          description: "Lake · Northern California")
        }
    }
}

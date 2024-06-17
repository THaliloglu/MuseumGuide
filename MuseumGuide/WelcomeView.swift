//
//  WelcomeView.swift
//  MuseumGuide
//
//  Created by TOLGA HALILOGLU on 2.06.2024.
//

import SwiftUI

struct WelcomeView: View {
    @Environment(AppModel.self) private var appModel
        
    var body: some View {
                
        ZStack {
            NavigationStack {
                VStack {
                    Spacer()

                    // Header
                    Text("Welcome to the Museum Guide")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()

                    // Description
                    Text("Explore the rich history and diverse collections of our museum. Discover artifacts, learn about historical events, and enjoy interactive exhibits.")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding()

                    Spacer()

                    // Button
                    HStack {
                        Spacer()
                        CollectionsToggle()
                        ImmersiveToggle()
                    }
                    
                }
                .padding()
            }
            .opacity(appModel.isShowingImmersive ? 0 : 1)
        }
        .animation(.default, value: appModel.isShowingImmersive)
        .overlay(alignment: .bottom) {
            ImmersiveToggle()
                .opacity(appModel.isShowingImmersive ? 1 : 0)
                .padding()
        }
    }
}

#Preview {
    WelcomeView()
        .environment(AppModel())
}

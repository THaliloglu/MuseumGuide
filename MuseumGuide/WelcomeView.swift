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
                    header
                    description
                    Spacer()
                    toggleButtons
                }
                .padding()
                .accessibilityElement(children: .contain)
                .accessibilityLabel("Welcome View")
                .accessibilityHint("Welcome screen with information and navigation options.")
            }
            .opacity(appModel.isShowingImmersive ? 0 : 1)
            
            ImmersiveToggle()
                .opacity(appModel.isShowingImmersive ? 1 : 0)
                .padding(.bottom)
                .accessibilityElement(children: .contain)
                .accessibilityLabel("Immersive Toggle")
                .accessibilityHint("Toggle immersive view mode.")
        }
        .animation(.default, value: appModel.isShowingImmersive)
    }
    
    private var header: some View {
        Text("Welcome to the Museum Guide")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding()
            .accessibilityLabel("Welcome to the Museum Guide")
            .accessibilityHint("Header text welcoming users to the Museum Guide app.")
    }
    
    private var description: some View {
        Text("Explore the rich history and diverse collections of our museum. Discover artifacts, learn about historical events, and enjoy interactive exhibits.")
            .font(.body)
            .multilineTextAlignment(.center)
            .padding()
            .accessibilityLabel("Explore the rich history and diverse collections of our museum. Discover artifacts, learn about historical events, and enjoy interactive exhibits.")
            .accessibilityHint("Description text providing an overview of what users can do with the Museum Guide app.")
    }
    
    private var toggleButtons: some View {
        HStack {
            Spacer()
            CollectionsToggle()
                .accessibilityLabel("Collections Toggle")
                .accessibilityHint("Toggle to view museum collections.")
            ImmersiveToggle()
                .accessibilityLabel("Immersive Toggle")
                .accessibilityHint("Toggle to enter immersive view mode.")
        }
    }
}

#Preview {
    WelcomeView()
        .environment(AppModel())
}

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
            }
            .opacity(appModel.isShowingImmersive ? 0 : 1)
            
            ImmersiveToggle()
                .opacity(appModel.isShowingImmersive ? 1 : 0)
                .padding(.bottom)
        }
        .animation(.default, value: appModel.isShowingImmersive)
    }
    
    private var header: some View {
        Text("Welcome to the Museum Guide")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding()
    }
    
    private var description: some View {
        Text("Explore the rich history and diverse collections of our museum. Discover artifacts, learn about historical events, and enjoy interactive exhibits.")
            .font(.body)
            .multilineTextAlignment(.center)
            .padding()
    }
    
    private var toggleButtons: some View {
        HStack {
            Spacer()
            CollectionsToggle()
            ImmersiveToggle()
        }
    }
}

#Preview {
    WelcomeView()
        .environment(AppModel())
}

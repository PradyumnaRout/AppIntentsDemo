//
//  ContentView.swift
//  AppIntentsDemo
//
//  Created by hb on 17/07/25.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.scenePhase) private var scenePhase
    
    @State private var features: [Feature] = []
    @State private var hasEntryOnAppeared: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                List(features) { feature in
                    Text(feature.title)
                }
            }
            .navigationTitle("Platforms")
        }
        .onAppear {
            if !hasEntryOnAppeared {
                print("get data in on appear")
                loadFeatures()
                hasEntryOnAppeared = true
            }
        }
        .onChange(of: scenePhase) { newPhase in
            if newPhase == .active {
                if !hasEntryOnAppeared {
                    print("loadFeatures from scenePhase (app resumed)")
                    loadFeatures()
                }
            } else if newPhase == .inactive || newPhase == .background {
                hasEntryOnAppeared = false
            }
        }
    }
    
    private func loadFeatures() {
        features = FeatureManager.shared.fetchFeatures(context: modelContext)
    }
}

#Preview {
    ContentView()
}

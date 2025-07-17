//
//  AppIntentsDemoApp.swift
//  AppIntentsDemo
//
//  Created by hb on 17/07/25.
//

import SwiftUI

@main
struct AppIntentsDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Feature.self)
        }
    }
}

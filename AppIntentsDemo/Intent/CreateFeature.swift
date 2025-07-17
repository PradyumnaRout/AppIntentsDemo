//
//  CreateFeature.swift
//  AppIntentsDemo
//
//  Created by hb on 17/07/25.
//

import SwiftUI
import AppIntents
import SwiftData

/**
 - App Intent to allow the user to create a new Feature from outside the app. The key aspects here are:

 The App Intent’s title
 Wether the Intent will open the app when run
 The parameters, including the prompts for each one of them
 A summary of what the App Intent does
 The action and result of the App Intent
 */

// https://superwall.com/blog/an-app-intents-field-guide-for-ios-developers

struct CreateFeature: AppIntent {
    // MARK: - Properties
    
    static var title: LocalizedStringResource = "Create Feature"
    static var openAppWhenRun: Bool = false
    
    // MARK: - Parameters
    
    @Parameter(
        title: "Platform",
        requestValueDialog: "Where would you like to see this feature?"
    )
    var platform: Platform
    
    @Parameter(
        title: "Title",
        requestValueDialog: "What's the title of the feature?"
    )
    var title: String
    
    @Parameter(
        title: "Description",
        requestValueDialog: "What's the description of the feature?"
    )
    var description: String
    
    
    // With Default Value
    /**
     @Parameter(
         title: "Title",
         default: "Live Activities",
         requestValueDialog: "What's the title of the feature?"
     )
     var title: String

     @Parameter(
         title: "Description",
         default: "Support notifications on Lock Screen",
         requestValueDialog: "What's the description of the feature?"
     )
     var description: String

     */
    
    
    // MARK: - Summary
    
    static var parameterSummary: some ParameterSummary {
//        Summary("Create a new feature for the platform \(\.$platform)") // only ask for platform
        
        Summary {
            \.$title
            \.$description
            \.$platform
        }
    }
    
    // MARK: - Perform
    // Called after the intent is executed.
    @MainActor
    func perform() async throws -> some IntentResult & ReturnsValue<String> {
        FeatureManager.shared.addFeatureFromIntent(title: title, description: description, platform: platform)
        print("Title: \(title)")
        print("Description: \(description)")
        print("Platform: \(platform.rawValue)")
        print("The app intent is executed")
        return .result(value: "New Feature for \(platform.rawValue)\n\n\(title):\n\(description)")
    }
}



import Foundation

// MARK: - App Shortcuts

struct AppShortcuts: AppShortcutsProvider {
    
    @AppShortcutsBuilder
    static var appShortcuts: [AppShortcut] {
        
        // Customize phrases
        /**
         phrases: [
             "Create feature in \(.applicationName)",
             "New feature for \(.applicationName)"
         ]
         */
        AppShortcut(
            intent: CreateFeature(),
            phrases: ["Make a New \(.applicationName)"],        // Acess by using this in siri.
            shortTitle: LocalizedStringResource(stringLiteral: "New Feature"),
            systemImageName: "apple.logo"
        )
    }
    
}

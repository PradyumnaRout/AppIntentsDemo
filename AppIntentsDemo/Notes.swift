//
//  Notes.swift
//  AppIntentsDemo
//
//  Created on 17/07/25.
//

/**
 
 AppIntent -
 Allows apps to expose specific functionality to the systen and other apps in a structed, secure and  declarative way.
 
 AppIntent is a Swift protocol that defines an action or command that your app can perform. You use this to make your app's functionality available in:

 Siri
 Shortcuts app
 Spotlight search
 Widgets
 App Clips
 App Intents daemon (background processing — especially relevant in iOS 18)
 
 
 
 Why do we need App Intents? -->
 
 You need AppIntent to allow your app to:

 1.Integrate with Siri & Shortcuts
 2.Allow users to trigger app actions using voice or automations.

 Ex: "Hey Siri, log my water intake" → calls an AppIntent in your health app.

 3.Enable Background Tasks (iOS 18+)
 -In iOS 18, App Intents can now be used with Background Assets and Push Notifications to perform downloads and sync tasks even when the app is not open.

 4.Power App Shortcuts in Spotlight Se arch
 - Show custom commands from your app in Spotlight search or Siri Suggestions.

 5.Remove Dependency on UI
  -AppIntents are declarative, data-driven, and don't need UI. They’re perfect for automation.

 6.Enable rich integration in Widgets and Live Activities
 - Use them for intent-based actions in Widgets and Live Activities.


 
 our App Intent to allow the user to create a new Feature from outside the app. The key aspects here are:

 The App Intent’s title
 Wether the Intent will open the app when run
 The parameters, including the prompts for each one of them
 A summary of what the App Intent does
 The action and result of the App Intent
 
 
 */

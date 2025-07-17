//
//  FeatureManager.swift
//  AppIntentsDemo
//
//  Created on 17/07/25.
//

import SwiftUI
import SwiftData

// CRUD operation of Feature

@MainActor
class FeatureManager: ObservableObject {
    
    static let shared = FeatureManager()
    
    @Published var features: [Feature] = []
    
    /// Add a new feature
    func addFeature(title: String, description: String, platform: Platform, context: ModelContext) {
        withAnimation {
            let feature = Feature(title: title, featureDescription: description, platform: platform)
            context.insert(feature)
            try? context.save()
        }
    }
    
    func addFeatureFromIntent(title: String, description: String, platform: Platform) {
        
        let container = try! ModelContainer(for: Feature.self)
        let context = container.mainContext
        
        withAnimation {
            let feature = Feature(title: title, featureDescription: description, platform: platform)
            context.insert(feature)
            try? context.save()
        }
    }
    
    /// Delete a feature
    func deleteFeature(_ feature: Feature, context: ModelContext) {
        withAnimation {
            context.delete(feature)
            try? context.save()
        }
    }
    
    /// Fetch features (all or filtered)
    func fetchFeatures(context: ModelContext, platform: Platform? = nil) -> [Feature] {
        let descriptor = FetchDescriptor<Feature>(
            sortBy: [SortDescriptor(\.title)]
        )
//        if let platform {
//            descriptor.predicate = #Predicate { $0.platform == platform }
//        }
        
        do {
            features = try context.fetch(descriptor)
            return features
        } catch {
            print("Error in getting data")
            return []
        }
    }
}

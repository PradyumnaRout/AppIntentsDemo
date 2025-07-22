//
//  OrderLatteIntent.swift
//  AppIntentsDemo
//
//  Created by hb on 22/07/25.
//

import SwiftUI
import AppIntents


// Let's utilize the latest API form App Intents called "requestChoice". This API presents the user with a specified number of choice and returns the user's selection.


struct IntentChoiceOption {
    var title: String
}


struct OrderLatteIntent: AppIntent {
    
    // Title String
    static var title: LocalizedStringResource = "Order Latte"
    
    static var choices: [IntentChoiceOption] {
        [
            .init(title: "Small"),
            .init(title: "Medium"),
            .init(title: "Large")
        ]
    }
    
    func perform() async throws -> some IntentResult {
        
        return .result()
    }
}




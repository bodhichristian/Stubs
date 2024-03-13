//
//  StubsApp.swift
//  Stubs
//
//  Created by christian on 6/8/23.
//

import Observation
import SwiftUI
import SwiftData
import TipKit

@main
struct StubsApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Concert.self)
    }
    
    init() {
        // Purge TipKit data
        // try? Tips.resetDatastore()
        
        // Show passed Tip types regardless of validity
        // Tips.showTipsForTesting([FavoriteConcertTip.self])
        
        // Hide passed Tip types regardless of validity
        // Tips.hideTipsForTesting([ArtistsViewOptionsTip.self])
        
        // Tips.showAllTipsForTesting()
        // Tips.hideAllTipsForTesting()
        
        // Configure with default options
        // try? Tips.configure()
        
        try? Tips.configure(
            [
                .datastoreLocation(.applicationDefault), // TipKit Data storage location
                .displayFrequency(.hourly) // Set frequency of Tip presentation.
            ]
        )
    }
}




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
    
    init() {
        try? Tips.resetDatastore()
        try? Tips.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Concert.self)
    }
}




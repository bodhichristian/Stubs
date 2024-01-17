//
//  StubsApp.swift
//  Stubs
//
//  Created by christian on 6/8/23.
//

import Observation
import SwiftUI
import SwiftData


@main
struct StubsApp: App {
//    let modelContainer: ModelContainer
//    
//    init() {
//        do {
//            modelContainer = try ModelContainer(for: Concert.self)
//        } catch {
//            
//            fatalError(error.localizedDescription)
//        }
//    }
    var body: some Scene {
        WindowGroup {
            ContentView()

        }
        .modelContainer(for: [Concert.self, Artist.self])
    }
}

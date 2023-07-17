//
//  StubsApp.swift
//  Stubs
//
//  Created by christian on 6/8/23.
//

import SwiftUI
import SwiftData


@main
struct StubsApp: App {

    var body: some Scene {
        WindowGroup {
            ConcertsView()
        }
        .modelContainer(for: Concert.self)
    }
}

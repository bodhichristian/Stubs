//
//  StubsMacApp.swift
//  StubsMac
//
//  Created by christian on 6/29/24.
//

import Foundation
import SwiftUI
import SwiftData

@main
struct Stubs: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Concert.self, Artist.self])
    }
}

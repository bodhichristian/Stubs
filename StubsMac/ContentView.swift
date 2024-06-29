//
//  ContentView.swift
//  StubsMac
//
//  Created by christian on 6/29/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var selection: TabBarItem? = .stubs
    
    var body: some View {
        NavigationSplitView {
            Sidebarview(selection: $selection)
        } detail: {
            switch selection {
            case .stubs:
                Text("Stubs")
            case .artists:
                Text("Artists")
            case .profile:
                Text("Profile")
            case .venues:
                Text("Venues")
            case nil:
                Text("Select a category")
            }
        }

    }

}

#Preview {
    ContentView()
        .modelContainer(for: Concert.self, inMemory: true)
}

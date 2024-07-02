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
        } content: {
            switch selection {
            case .stubs:
                Text("Stubs")
            case .artists:
                Text("Artists")
            case .venues:
                Text("Venues")
            case .profile:
                Text("Profile")
            case nil:
                Text("Select a tab")
            }
        } detail: {
            switch selection {
            case .stubs:
                Text("Stub Detail")
            case .artists:
                Text("Artist Detail")
            case .profile:
                Text("Profile")
            case .venues:
                Text("Venue Detail")
            case nil:
                Text("Select a tab")
            }
        }

    }

}

#Preview {
    ContentView()
        .modelContainer(for: Concert.self, inMemory: true)
}

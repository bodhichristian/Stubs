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
    @Query var concerts: [Concert]
    @State private var selection: TabBarItem? = .stubs
    
    
    var body: some View {
        NavigationSplitView {
            Sidebarview(selection: $selection)
        } content: {
            switch selection {
            case .stubs:
                List(concerts) { concert in
                    StubCollectionRowLabel(concert: concert)
                }
            case .artists:
                Text("Artists")
            case .venues:
                Text("Venues")
            case nil:
                Text("Select a tab")
            }
        } detail: {
            switch selection {
            case .stubs:
                Text("Stub Detail")
            case .artists:
                Text("Artist Detail")
            case .venues:
                Text("Venue Detail")
            case nil:
                Text("Select a tab")
            }
        }
        .toolbar {
            ToolbarItem {
                Button {
                    let artistName = DebugData.artists.randomElement()!
                    let venue = DebugData.venues.randomElement()!
                    let notes = DebugData.notes.randomElement()!
                    let color = ["red", "orange", "yellow", "purple", "green", "blue"].randomElement()!
                    
                    let concert = Concert(
                        artistName: artistName,
                        venue: venue.name,
                        city: venue.city,
                        accentColor: color,
                        notes: notes,
                        venueLatitude: venue.latitude,
                        venueLongitude: venue.longitude
                    )
                    modelContext.insert(concert)
                    
                } label: {
                    Label("Add Concert", systemImage: "plus")
                }
                .keyboardShortcut(KeyEquivalent("n"), modifiers: [.command])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Concert.self, inMemory: true)
}

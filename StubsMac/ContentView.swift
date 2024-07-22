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
    @Query var artists: [Artist]
    @State private var selectedTab: TabBarItem? = .stubs
    @State private var selectedConcert: Concert? = nil
    @State private var selectedArtist: Artist? = nil
    
    @Namespace var namespace
    
    let artistService = ArtistService()
    
    var body: some View {
        NavigationSplitView {
            SidebarView(selection: $selectedTab)
        } content: {
            switch selectedTab {
            case .stubs:
                List(concerts, selection: $selectedConcert) { concert in
                    StubCollectionRowLabel(concert: concert)
                        .padding(.vertical, 6)
                        .tag(concert)
                        .contextMenu {
                            Button("Delete Concert") {
                                delete(concert)
                            }
                        }
                }
                .frame(minWidth: 300)
            case .artists:
                List(artists, selection: $selectedArtist) { artist in
                    
                    
                    HStack {
                        Image(nsImage: NSImage(data: artist.artistImageData ?? Data()) ?? NSImage())
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50)
                            .clipShape(Circle())
                            .shadow(radius: 7)
                        
                        Text(artist.artistName ?? "")
                            .font(.title3)
                            .fontWeight(.medium)
                        
                    }
                    .tag(artist)
                    .padding(.vertical, 4)
                    
                }
            case .venues:
                Text("Venues")
            case nil:
                Text("Select a tab")
            }
        } detail: {
            switch selectedTab {
            case .stubs:
                if let selectedConcert {
                    StubDetailViewMac(concert: selectedConcert)
                } else {
                    Text("Select a concert")
                }
            case .artists:
                if let selectedArtist {
                    ArtistDetailViewMac(artist: selectedArtist)
                } else {
                    Text("Select an artist")
                }
            case .venues:
                Text("Venue Detail")
            case nil:
                Text("Select a tab")
            }
        }
        .toolbar {
            ToolbarItem {
                Button {
                    Task {
                        try await addSampleConert()
                    }
                } label: {
                    Label("Add Concert", systemImage: "plus")
                }
                .keyboardShortcut(KeyEquivalent("n"), modifiers: [.command])
            }
        }
    }
    
    private func addSampleConert() async throws {
        let artistName = DebugData.artists.randomElement()!
        
        do {
            try await artistService.search(for: artistName)
        } catch {
            print(error.localizedDescription)
        }
        
        let venue = DebugData.venues.randomElement()!
        let notes = DebugData.notes.randomElement()!
        let color = ["red", "orange", "yellow", "purple", "green", "blue"].randomElement()!
        let iconName = StubStyle.icons.randomElement()!
        
        let concert = Concert(
            artistName: artistName,
            venue: venue.name,
            city: venue.city,
            iconName: iconName,
            accentColor: color,
            notes: notes,
            venueLatitude: venue.latitude,
            venueLongitude: venue.longitude
        )
        
        if let artist = artistService.fetchedArtist {
            concert.artist = artist
        }
        modelContext.insert(concert)
    }
    
    private func delete(_ concert: Concert) {
        modelContext.delete(concert)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Concert.self, inMemory: true)
}

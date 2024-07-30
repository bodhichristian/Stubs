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
    @Query(sort: \Artist.artistName) var artists: [Artist]
    @State private var selectedTab: TabBarItem? = .stubs
    @State private var selectedConcert: Concert = Concert()
    @State private var selectedArtist: Artist? = nil
    
    @Namespace var namespace
    
    let concertService = ConcertService()
    
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
                            .frame(width: 56)
                            .clipShape(Circle())
                            .shadow(radius: 7)
                            .padding(.leading, 10)
                            .padding(.trailing, 20)
                        
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
                if selectedConcert.artist == nil {
                    Text("Select a concert.")
                } else {
                    StubDetailViewMac(concert: selectedConcert, selectedConcert: $selectedConcert)
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
        //         Clear SwiftData store
//                .onAppear {
//                    modelContext.container.deleteAllData()
//                }
    }
    
    
    private func addSampleConert() async throws {
        let artistName = DebugData.artists.randomElement()!
        
        let descriptor = FetchDescriptor<Artist>(predicate: #Predicate { $0.artistName == artistName })
        let existingArtists = try modelContext.fetch(descriptor)
        
        if let existingArtist = existingArtists.first {
            print("➡️ Building concert with existing artist: \(existingArtist.artistName ?? "")")
            let concert = try await concertService.buildSampleConcert(with: existingArtist)
            modelContext.insert(concert)
        } else {
            print("🆕 Building concert with new artist: \(artistName)")
            let concert = try await concertService.buildSampleConcert()
            modelContext.insert(concert)
        }
    }
    
    private func delete(_ concert: Concert) {
        modelContext.delete(concert)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Concert.self, inMemory: true)
}

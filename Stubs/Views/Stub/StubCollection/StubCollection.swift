//
//  ContentView.swift
//  Stubs
//
//  Created by christian on 6/8/23.
//

import SwiftUI
import SwiftData

// MARK: StubCollection
// A View for displaying and searching for saved concerts
// Performs query from SwiftData store
// Groups concerts by decade

struct StubCollection: View {
    @Environment(\.modelContext) private var modelContext
    
    @Query(sort: \Concert.date) private var concerts: [Concert]
    
    @State private var isAddingConcert = false
    @State private var searchText = ""
    
    let searchPrompt = "Artist, Venue, City, or Date"
    
    var body: some View {
        NavigationView {
            VStack {
                
                if concerts.isEmpty { // If no concerts have been saved
                    NoStubsView(modelContext: _modelContext, isAddingConcert: $isAddingConcert)
                    
                } else  {
                    
                    List {
                        
                        // Sort concerts in reverse chronological order
                        ForEach(concertsByYear.keys.sorted().reversed(), id: \.self) { year in
                            
                            // Create a section for each decade
                            Section(header: decadeHeader(year)) {
                                
                                // Create a NavLink to StubDetailView for each concert
                                ForEach(concertsByYear[year] ?? [Concert](), id: \.id) { concert in
                                    
                                    NavigationLink {
                                        StubDetailView(concert: concert)
                                        
                                    } label: {
                                        StubCollectionRowLabel(concert: concert)
                                    }
                                }
                            }
                        }
                    }
                    .searchable(text: $searchText, prompt: searchPrompt) // Search bar
                    
                }
                
            }
            .navigationTitle("Stubs")
            .sheet(isPresented: $isAddingConcert) {
                StubEditor()
            }
            .toolbar {
                ToolbarItem {
                    Button("Demo") {
                        addSampleConcert()
                    }
                }
                
                ToolbarItem {
                    Button {
                        isAddingConcert = true
                    } label: {
                        Label("Add Concert", systemImage: "plus")
                    }
                }
            }
            
        }
    }
}

#Preview {
    StubCollection()
        .modelContainer(for: Concert.self, inMemory: true)
}

extension StubCollection {
    // Concerts whose data contains searchText
    private var filteredConcerts: [Concert] {
        if searchText.isEmpty {
            return concerts
        } else {
            return concerts.filter { concert in
                return concert.artistName.lowercased().contains(searchText.lowercased()) ||
                concert.venue.lowercased().contains(searchText.lowercased()) ||
                concert.city.lowercased().contains(searchText.lowercased()) ||
                concert.date.formatted().contains(searchText)
            }
        }
    }
    // Concerts sorted into decade groups
    private var concertsByYear: [Int: [Concert]] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        
        let groups = Dictionary(grouping: filteredConcerts) { concert in
            let year = Calendar.current.component(.year, from: concert.date)
            //let decade = (year / 10) * 10 // Round down to the nearest decade
            return year
        }
        
        return groups.mapValues { concerts in
            concerts.sorted { concert1, concert2 in
                concert1.date > concert2.date
            }
        }
    }
    // Header for decade sections in list
    private func decadeHeader(_ decade: Int) -> some View {
        
        
        Text(("\(decade)")
            .replacingOccurrences(of: ",", with: ""))
        .textCase(nil)
        
        .font(.title2)
        .bold()
        
    }
    // Delete concert
    private func delete(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(concerts[index])
            }
        }
    }
    
    private func addSampleConcert() {
        let service = ArtistService()
        
        let artistName = DebugData.artists.randomElement()!
        let venue = DebugData.venues.randomElement()!
        let notes = DebugData.notes.randomElement()!
        let icon = StubStyle.icons.randomElement()!
        let color = StubStyle.colors.randomElement()!
        let isFavorite = Bool.random()
        let date = calendar.date(
            from: DateComponents(
                year: Int.random(
                    in: 2015...2023),
                month: Int.random(in: 1...12),
                day: Int.random(in: 1...28)
            )
        )!
        
        Task {
            if let artist = await service.debugSearch(for: artistName) {
                // Use the fetched artist here
                
                
                let newConcert = Concert(
                    artistName: artistName,
                    venue: venue.name,
                    city: venue.city,
                    date: date,
                    iconName: icon,
                    accentColor: color,
                    notes: notes,
                    isFavorite: isFavorite,
                    venueLatitude: venue.latitude,
                    venueLongitude: venue.longitude,
                    artist: artist
                )
                
                modelContext.insert(newConcert)
            } else {
                print("there was an error adding the sample artist.")
            }
        }
        
        
        
    }
}

//
//  ContentView.swift
//  Stubs
//
//  Created by christian on 6/8/23.
//

import SwiftUI
import SwiftData

// MARK: ConcertCollection - SwiftUI View
// A View for displaying and searching for saved concerts
// Performs query from SwiftData store
// Groups concerts by decade

struct ConcertCollection: View {
    @Environment(\.modelContext) private var modelContext
    
    @Query private var concerts: [Concert]
    
    @State private var isAddingConcert = false
    @State private var searchText = ""
    
    let searchPrompt = "Artist, Venue, City, or Date"
    
    var body: some View {
        NavigationView {
            VStack {
                
                if concerts.isEmpty { // If no concerts have been saved
                    NoConcertsView(modelContext: _modelContext, isAddingConcert: $isAddingConcert)
                } else  {
                    List {
                        // Sort concerts in reverse chronological order
                        ForEach(concertsByDecade.keys.sorted().reversed(), id: \.self) { decade in
                            // Create a section for each decade
                            Section(header: decadeHeader(decade)) {
                                // Create a NavLink to ConcertDetailView for each concert
                                ForEach(concertsByDecade[decade]!, id: \.id) { concert in
                                    NavigationLink{
                                        ConcertDetailView(concert: concert)
                                    } label: {
                                        ConcertLabel(concert: concert)
                                    }
                                }
                            }
                        }
                    }
                    .searchable(text: $searchText, prompt: searchPrompt) // Search bar
                    
                }
                    
            }
            .navigationTitle("Concerts")
            .sheet(isPresented: $isAddingConcert) {
                AddConcertView()
            }
            .toolbar {
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
    ConcertCollection()
        .modelContainer(for: Concert.self, inMemory: true)
}

extension ConcertCollection {
    // Concerts whose data contains searchText
    private var filteredConcerts: [Concert] {
        if searchText.isEmpty {
            return concerts
        } else {
            return concerts.filter { concert in
                return concert.artist.lowercased().contains(searchText.lowercased()) ||
                concert.venue.lowercased().contains(searchText.lowercased()) ||
                concert.city.lowercased().contains(searchText.lowercased()) ||
                concert.date.formatted().contains(searchText)
            }
        }
    }
    // Concerts sorted into decade groups
    private var concertsByDecade: [Int: [Concert]] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        
        let groups = Dictionary(grouping: filteredConcerts) { concert in
            let year = Calendar.current.component(.year, from: concert.date)
            let decade = (year / 10) * 10 // Round down to the nearest decade
            return decade
        }
        
        return groups.mapValues { concerts in
            concerts.sorted { concert1, concert2 in
                concert1.date > concert2.date
            }
        }
    }
    // Header for decade sections in list
    private func decadeHeader(_ decade: Int) -> some View {
        Text(("\(decade)s")
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
    
    
}

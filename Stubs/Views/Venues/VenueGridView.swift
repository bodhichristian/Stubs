//
//  VenueGridView.swift
//  Stubs
//
//  Created by christian on 1/27/24.
//

import SwiftUI
import SwiftData

struct VenueGridView: View {
    @Query var concerts: [Concert]
    
    @State private var searchText = ""
    @State private var showingAllVenues = false
    @Namespace var namespace 
    
    private var venues: [Concert] {
        var uniqueVenues = Set<String>()
        
        return concerts.filter { concert in
            if !uniqueVenues.contains(concert.venue) {
                uniqueVenues.insert(concert.venue)
                return true
            }
            return false
        }
    }
    
    private var filteredVenues: [Concert] {
        if searchText.isEmpty {
            return venues
        } else {
            return venues.filter { $0.venue.lowercased().contains(searchText.lowercased())}
        }
    }
    
    
    private let columns = [
        GridItem(.adaptive(minimum: 120))
    ]
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(filteredVenues, id: \.venue) { concert in
                    VenueGridItem(concert: concert)
                }
            }
            .searchable(text: $searchText, prompt: "Search Venues")
        }
        .ignoresSafeArea(edges: .bottom)
        .padding(.horizontal)
        .navigationTitle("Venues")
    }
}

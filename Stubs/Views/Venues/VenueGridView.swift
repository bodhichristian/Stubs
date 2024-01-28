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
    
    
    private let columns = [
        GridItem(.adaptive(minimum: 120))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(venues, id: \.venue) { concert in
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

#Preview {
    VenueGridView()
}

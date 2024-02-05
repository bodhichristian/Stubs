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
    @State private var showingAllVenues = true
    @State private var selectedVenue: Concert?
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
            return venues.filter {
                $0.venue.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    private var sortedVenues: [Concert] {
        return filteredVenues.sorted {
            $0.venue < $1.venue
        }
    }
    
    
    private let columns = [
        GridItem(.adaptive(minimum: 120))
    ]
    
    var body: some View {
        GeometryReader { geo in
            if showingAllVenues {
                ScrollView {
                    VStack {
                        ForEach(sortedVenues, id: \.venue) { concert in
                            VenueGridItem(concert: concert)
                                .matchedGeometryEffect(id: concert.uuid, in: namespace)
                                .onTapGesture {
                                    withAnimation(.snappy){
                                        selectedVenue = concert
                                        showingAllVenues = false
                                    }
                                }
                        }
                    }
                    .searchable(text: $searchText, prompt: "Search Venues")
                    .padding(.bottom, 80)

                }
                .ignoresSafeArea(edges: .bottom)
                .padding(.horizontal)
            } else {
                if let selectedVenue {
                    VStack(alignment: .trailing) {
                        Button {
                            withAnimation(.snappy){
                                showingAllVenues = true
                            }
                        } label: {
                                Image(systemName: "x.circle.fill")
                                .padding(.trailing)
                            
                        }
                        .font(.headline)
                        .foregroundStyle(.secondary)
                        .padding(.top, 5)
                        
                        VenueGridExpandedMapView(concert: selectedVenue)
                            .padding(.horizontal)
                            .padding(.bottom, 65)
                            .matchedGeometryEffect(id: selectedVenue.uuid, in: namespace)
                            .navigationBarTitleDisplayMode(.inline)
                    }

                }
            }
        }
        
    }
}

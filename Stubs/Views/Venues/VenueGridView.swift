//
//  VenueGridView.swift
//  Stubs
//
//  Created by christian on 1/27/24.
//

import SwiftUI
import SwiftData

struct VenueGridView: View {
    @Namespace var namespace

    @Query var concerts: [Concert]
    
    @State private var listView = true
    @State private var searchText = ""
    @State private var showingAllVenues = true
    @State private var selectedVenue: Concert?
    @State private var sortOrder: SortOrder = .byNameAscending
    
    
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
        if sortOrder == .byNameAscending {
            return filteredVenues.sorted {
                $0.venue < $1.venue
            }
        } else {
            return filteredVenues.sorted {
                $0.venue > $1.venue
            }
        }
    }
    
    
    private let columns = [
        GridItem(.adaptive(minimum: 120))
    ]
    
    var body: some View {
        GeometryReader { geo in
            if showingAllVenues {
                ScrollView {
                    if listView {
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
                        .padding(.bottom, 100)
                        
                    }
                    
                    else {
                        LazyVGrid(columns: columns) {
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
                        .padding(.bottom, 100)
                        
                    }
                    
                    

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
        .toolbar {
            ToolbarItem {
                if showingAllVenues {
                    Menu {
                        Button {
                            withAnimation(.smooth(extraBounce: 0.2)) {
                                listView.toggle()
                            }
                        } label: {
                            Label(
                                listView
                                ? "Switch to Grid View"
                                : "Switch to List View",
                                systemImage: listView
                                ? "square.grid.2x2"
                                : "list.bullet"
                            )
                        }
                        
                        Section {
                            
                            Button {
                                withAnimation(.smooth(extraBounce: 0.2)){
                                    sortOrder = .byNameAscending
                                }
                            } label: {
                                Label(
                                    "Sort by Venue Name A-Z",
                                    systemImage: "a.square"
                                )
                            }
                            
                            Button {
                                withAnimation(.snappy){
                                    sortOrder = .byNameDescending
                                }
                            } label: {
                                Label(
                                    "Sort by Venue Name Z-A",
                                    systemImage: "z.square"
                                )
                            }
                            
                        }
                        
                    } label: {
                        Label(
                            "View Options",
                            systemImage: "list.bullet"
                        )
                    }
                }
            }
        }
    }
}

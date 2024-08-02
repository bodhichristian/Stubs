//
//  VenueGridView.swift
//  Stubs
//
//  Created by christian on 1/27/24.
//

import SwiftUI
import SwiftData

struct VenuesView: View {
    let concerts: [Concert]
    
    @Namespace var namespace
    
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
        switch sortOrder {
        case .byNameDescending:
            return filteredVenues.sorted {
                $0.venue > $1.venue
            }

        case .byCityAscending:
            return filteredVenues.sorted {
                $0.city < $1.city
            }
        case .byCityDescending:
            return filteredVenues.sorted {
                $0.city > $1.city
            }
        default:
            return filteredVenues.sorted {
                $0.venue < $1.venue
            }
        }
        
    }
    
    private let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                if showingAllVenues {
                    ScrollView {
                        VStack {
                            ForEach(sortedVenues, id: \.venue) { concert in
                                VenueTile(
                                    concert: concert,
                                    listView: .constant(true)
                                )
                                .matchedGeometryEffect(
                                    id: concert.uuid,
                                    in: namespace
                                )
                                .onTapGesture {
                                    withAnimation(){
                                        selectedVenue = concert
                                        showingAllVenues = false
                                    }
                                }
                            }
                        }
                        .searchable(
                            text: $searchText,
                            prompt: "Search Venues"
                        )
                        .padding(.bottom, 100)
                    }
                    .ignoresSafeArea(edges: .bottom)
                    
                } else {
                    if let selectedVenue {
                        VStack() {
                            
                            VenueGridExpandedMapView(concert: selectedVenue)
                                .padding(.top, 10)
                            
                            ZStack(alignment: .trailing) {
                                
                                VenueTile(
                                    concert: selectedVenue,
                                    listView: .constant(true)
                                )
                                .matchedGeometryEffect(
                                    id: selectedVenue.uuid,
                                    in: namespace
                                )
                                
                                Button {
                                    withAnimation(.snappy){
                                        showingAllVenues = true
                                    }
                                } label: {
                                    Image(systemName: "x.circle.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40)
                                        .fontDesign(.monospaced)
                                        .fontWeight(.bold)
                                }
                                .font(.headline)
                                .foregroundStyle(.secondary.opacity(0.7))
                                .padding()
                            }
                        }
                        .transition(.asymmetric(insertion: .push(from: .leading), removal: .push(from: .trailing)))
                        .navigationBarTitleDisplayMode(.inline)

                        .padding(.bottom, 65)
                        
                    }
                }
            }
            .navigationTitle("Venues")
            .navigationBarTitleDisplayMode(.large)
          
            .padding(.horizontal)
            .toolbar {
                ToolbarItem {
                    if showingAllVenues {
                        Menu {
                            
                            
                            Button {
                                withAnimation(.smooth(extraBounce: 0.2)){
                                    sortOrder = .byNameAscending
                                }
                            } label: {
                                Label(
                                    "Sort by Venue A-Z",
                                    systemImage: "a.square"
                                )
                            }
                            
                            Button {
                                withAnimation(.snappy){
                                    sortOrder = .byNameDescending
                                }
                            } label: {
                                Label(
                                    "Sort by Venue Z-A",
                                    systemImage: "z.square"
                                )
                            }
                            
                            Button {
                                withAnimation(.snappy){
                                    sortOrder = .byCityAscending
                                }
                            } label: {
                                Label(
                                    "Sort by City A-Z",
                                    systemImage: "a.square"
                                )
                            }
                            
                            Button {
                                withAnimation(.snappy){
                                    sortOrder = .byCityDescending
                                }
                            } label: {
                                Label(
                                    "Sort by City Z-A",
                                    systemImage: "z.square"
                                )
                            }
                            
                            
                            
                        } label: {
                            ToolbarButtonLabel(
                                text: "Sort",
                                symbol: "arrow.up.arrow.down.circle"
                            )
                        }
                    }
                    
                }
            }
            .tint(.primary)
        }
    }
}

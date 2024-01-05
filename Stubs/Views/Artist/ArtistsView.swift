//
//  ArtistsView.swift
//  Stubs
//
//  Created by christian on 12/29/23.
//

import SwiftUI
import SwiftData

struct ArtistsView: View {
    
    @Query var concerts: [Concert]
    
    private var artists: [String] {
        // Map concert artist names to an array
        // Convert to a Set to create a collection of unique artists
        // Convert to an alphabetically sorted array to use in ForEach
        return Array(Set(concerts.map({ $0.artist }))).sorted()
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(artists, id: \.self){ artist in
                        NavigationLink {
                            ArtistDetailView(artist: artist)
                        } label: {
                            Text(artist)
                        }
                    }
                }
            }
            .navigationTitle("Artists")

        }
    }
}

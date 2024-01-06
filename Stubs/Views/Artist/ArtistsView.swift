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
    
    @State private var model = ArtistService()
    
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
                        ForEach(model.artists, id: \.idArtist){ artist in
                            NavigationLink {
                                ArtistDetailView(artist: artist)
                            } label: {
                                Text(artist.strArtist ?? "")
                            }
                        }
                    }
                
                
            }
            .navigationTitle("Artists")
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
                    model.search(for: artists)
                }
            }
        }
       
    }
}

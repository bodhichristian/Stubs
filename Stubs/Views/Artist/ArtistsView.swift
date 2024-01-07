//
//  ArtistsView.swift
//  Stubs
//
//  Created by christian on 12/29/23.
//

// TODO: Find a way to load images in this view and pass to detail views. Currently artist images load here.



import SwiftUI
import SwiftData

struct ArtistsView: View {
    
    @Query var concerts: [Concert]
    
    @State private var model = ArtistService()
    
    private var artistNames: [String] {
        // Map concert artist names to an array
        // Convert to a Set to create a collection of unique artists
        // Convert to an alphabetically sorted array to use in ForEach
        return Array(Set(concerts.map({ $0.artistName }))).sorted()
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(artistNames, id: \.self){ artist in
                        NavigationLink {
                            ArtistDetailView(artistName: artist)
                        } label: {
                            
                            
                            
                            
                            Text(artist )
                            
                            
                            
                            
                            
                        }
                    }
                }
                
                
            }
            .navigationTitle("Artists")
            
        }
        
    }
}

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
    
    private var artists: [Artist] {
        var artists = [Artist]()
        for concert in concerts {
            if let artist = concert.artist {
                artists.append(artist)
            }
        }
        let uniqueArtists = Set(artists)
        let sortedArists = Array(uniqueArtists).sorted { $0.strArtist ?? "" < $1.strArtist ?? "" }
        return sortedArists
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(artists, id: \.strArtist){ artist in
                        NavigationLink {
                            ArtistDetailView(artist: artist)
                        } label: {
                            
                            
                            
                            HStack {
                                
                                ArtistDetailProfileImage(artist: artist, width: 40)
                            
                                Text(artist.strArtist ?? "")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                
                                
                            }
                            
                            
                        }
                    }
                }
                
                
            }
            .navigationTitle("Artists")
            
        }
        
    }
}

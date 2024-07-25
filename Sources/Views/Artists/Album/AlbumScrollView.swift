//
//  AlbumsByArtist.swift
//  Stubs
//
//  Created by christian on 12/13/23.
//

import SwiftUI
import Combine


// TODO: Update data flow to fix AlbumScrollView Image fetching


struct AlbumScrollView: View {
    let artist: Artist
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                if artist.albums == nil {
                    AlbumScrollViewPlaceholder()
                } else {
                        ZStack {
                            TileBase()
                            
                            VStack(spacing: 2) {
                                Text("Appears on")
                                    .font(.headline)
                                    .foregroundStyle(.secondary)
                                
                                StatViewLabel(
                                    count: artist.albums?.count ?? 0,
                                    statNameSingular: "Release",
                                    statNamePlural: "Releases"
                                )
                            }
                        
                        }
                    .frame(maxHeight: .infinity)
                    .frame(width: 130)
                    .padding(.horizontal, 2)
                    
                    if let albums = artist.albums {
                        ForEach(
                            albums.sorted {
                                $0.intYearReleased ?? "" > $1.intYearReleased ?? ""
                            }, id: \.idAlbum
                        ) { album in
                            AlbumScrollViewLabel(album: album)
                        }
                    }
                }
            }
            .frame(height: 160)
            .padding(.vertical, 4)
        }
        
        .padding(.horizontal)
//        .onAppear {
//            Task {
//                try await model.searchAlbums(for: artistID)
//            }
//        }
    }
}



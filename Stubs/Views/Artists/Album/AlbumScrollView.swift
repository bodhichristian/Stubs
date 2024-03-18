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
    let artistID: String
    
    @State private var model = AlbumService()
    
    private var albumCount: Int {
        return model.albums.count
    }
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                if model.albums.isEmpty {
                    AlbumScrollViewPlaceholder()
                } else {
                        ZStack {
                            TileBase()
                            
                            VStack(spacing: 2) {
                                Text("Appears on")
                                    .font(.headline)
                                    .foregroundStyle(.secondary)
                                
                                StatViewLabel(
                                    count: albumCount,
                                    statNameSingular: "Release",
                                    statNamePlural: "Releases"
                                )
                            }
                        
                        }
                    .frame(maxHeight: .infinity)
                    .frame(width: 130)
                    .padding(.horizontal, 2)
                    
                    ForEach(
                        model.albums.sorted {
                            $0.intYearReleased ?? "" > $1.intYearReleased ?? ""
                        }, id: \.idAlbum
                    ) { album in
                        AlbumScrollViewLabel(album: album)
                    }
                }
            }
            .frame(height: 160)
            .padding(.vertical, 4)
        }
        
        .padding(.horizontal)
        .onAppear {
            Task {
                await model.searchAlbums(for: artistID)
            }
        }
    }
}



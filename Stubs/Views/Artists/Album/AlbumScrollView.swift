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
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text("Albums")
                .font(.title2.bold())
                
            
            ScrollView(.horizontal) {
                HStack {
                    if model.albums.isEmpty {
                        AlbumScrollViewPlaceholder()
                    } else {
                        ForEach(
                            model.albums.sorted {
                                $0.intYearReleased ?? "" > $1.intYearReleased ?? ""
                            }, id: \.idAlbum) { album in
                                AlbumScrollViewLabel(album: album)
                            }
                    }
                }
                .padding(.vertical, 2)
            }
            Spacer()
        }
        .padding(.horizontal)
        .onAppear {
            model.searchAlbums(for: artistID)
        }
    }
}



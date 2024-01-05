//
//  AlbumsByArtist.swift
//  Stubs
//
//  Created by christian on 12/13/23.
//

import SwiftUI
import Combine

struct AlbumScrollView: View {
    let artist: String
    
    @State private var model = AlbumService()
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
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
                .padding(.vertical)
            }
            Spacer()
        }
        .padding()
        .onAppear {
            model.searchAlbums(for: artist)
        }
    }
}


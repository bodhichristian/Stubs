//
//  AlbumsByArtist.swift
//  Stubs
//
//  Created by christian on 12/13/23.
//

import SwiftUI
import Combine

struct AlbumsScrollView: View {
    let artist: String
    
    @State private var model = AlbumService()
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            Text("Albums")
                .font(.title2.bold())
            
            ScrollView(.horizontal) {
                
                HStack {
                    if model.albums.isEmpty {
                        ForEach(0..<5) { _ in
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.secondary.opacity(0.1))
                                .frame(width: 100, height: 100)
                                .shadow(radius: 3, x: 5, y: 5)
                                .padding(.trailing, 10)
                            
                        }
                    } else {
                        ForEach(
                            model.albums.sorted {
                                
                                $0.intYearReleased ?? "" > $1.intYearReleased ?? ""
                                
                            }, id: \.idAlbum) { album in
                                
                                VStack(alignment: .leading) {
                                    
                                    AsyncImage(
                                        url: URL(
                                            string: album.strAlbumThumb ?? ""
                                        )
                                    ) { image in
                                        image
                                            .resizable()
                                            .scaledToFit()
                                    } placeholder: {
                                        Color.secondary.opacity(0.1)
                                    }
                                    .frame(width: 86, height: 86)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .shadow(radius: 3, x: 5, y: 5)
                                    .padding(.trailing, 10)
                                    
                                    Text(album.strAlbum ?? "")
                                        .font(.headline)
                                        .frame(maxWidth: 100, alignment: .leading)
                                        .lineLimit(1)
                                    
                                    Text(album.intYearReleased ?? "")
                                        .font(.subheadline)
                                        .foregroundStyle(.secondary)
                                }
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

#Preview {
    AlbumsScrollView(artist: SampleData.concerts[0].artist)
}


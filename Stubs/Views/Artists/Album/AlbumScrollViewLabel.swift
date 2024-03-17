//
//  AlbumLabelView.swift
//  Stubs
//
//  Created by christian on 1/4/24.
//

import SwiftUI

struct AlbumScrollViewLabel: View {
    let album: AlbumService.Album
    
    var body: some View {
        ZStack {
            TileBase()
            
            VStack(alignment: .leading) {
                
                AsyncImage(
                    url: URL(
                        string: album.strAlbumThumb ?? ""
                    )
                ) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 90, height: 90)

                } placeholder: {
                    Color.secondary.opacity(0.1)
                }
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .frame(width: 90, height: 90)
                .shadow(radius: 5, y: 3)

                Text(album.strAlbum ?? "")
                    .font(.headline)
                    .frame(maxWidth: 90, alignment: .leading)
                    .lineLimit(1)
                
                Text(album.intYearReleased ?? "")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
        .frame(width: 110, height: 160)
    }
}


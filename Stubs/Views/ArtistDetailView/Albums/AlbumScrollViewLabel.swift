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


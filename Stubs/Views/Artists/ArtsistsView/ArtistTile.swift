//
//  ArtistTile.swift
//  Stubs
//
//  Created by christian on 2/17/24.
//

import SwiftUI

struct ArtistTile: View {
    let artist: Artist
    @Binding var listView: Bool
    
    var body: some View {
        ZStack {
            Image(uiImage: UIImage(data: artist.artistImageData ?? Data()) ?? UIImage())
                .resizable()
                .scaledToFill()
                .frame(height: listView ? 60 : 160)
                .frame(maxWidth: listView ? .infinity : 120)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            TileBase()
        }
    }
}

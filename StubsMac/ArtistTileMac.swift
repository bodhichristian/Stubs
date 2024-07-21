//
//  ArtistTileMac.swift
//  StubsMac
//
//  Created by christian on 7/21/24.
//

import SwiftUI

struct ArtistTileMac: View {
    let artist: Artist
    let listView: Bool
    
    var body: some View {
        ZStack {
            Image(nsImage: NSImage(data: artist.artistImageData ?? Data()) ?? NSImage())
                .resizable()
                .scaledToFill()
                .frame(height: listView ? 60 : 160)
                .frame(maxWidth: listView ? .infinity : 120)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            TileBase()
        }
        .contentShape(RoundedRectangle(cornerRadius: 10))
    }
}


#Preview {
    ArtistTileMac(artist: Artist(), listView: false)
}

//
//  ArtistsViewListRowLabel.swift
//  Stubs
//
//  Created by christian on 3/2/24.
//

import SwiftUI

struct ArtistListRowLabel: View {
    let artist: Artist
    let listView: Bool
    let namespace: Namespace.ID
    
    var body: some View {
        ZStack {
            ArtistTile(
                artist: artist,
                listView: listView
            )
            .frame(height: 60)
            .matchedGeometryEffect(
                id: artist.artistImageURL,
                in: namespace
            )
            
            HStack {
                ArtistImageView(
                    imageData: artist.artistImageData
                )
                    .frame(width: 44)
                    .matchedGeometryEffect(
                        id: artist.artistID,
                        in: namespace
                    )
                
                Text(artist.artistName ?? "")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    
                Spacer()

                StubCountIndicator(artist: artist)
                    .matchedGeometryEffect(
                        id: artist.bannerImageURL,
                        in: namespace
                    )
                    .padding(.leading, 5)
                
                
                
                Image(systemName: "chevron.right")
                    .foregroundStyle(.secondary.opacity(0.5))
                    .frame(width: 10)
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
        }
        .accessibilityLabel(artist.artistName ?? "")
    }
}

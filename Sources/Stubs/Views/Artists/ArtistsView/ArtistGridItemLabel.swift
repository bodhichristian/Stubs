//
//  ArtistsViewGridItemLabel.swift
//  Stubs
//
//  Created by christian on 3/2/24.
//

import SwiftUI

struct ArtistGridItemLabel: View {
    let artist: Artist
    let namespace: Namespace.ID
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                ArtistImageView(imageData: artist.artistImageData)
                    .matchedGeometryEffect(
                        id: artist.artistID,
                        in: namespace
                    )
                
                StubCountIndicator(artist: artist)
                    .offset(x: -4)
                    .matchedGeometryEffect(
                        id: artist.bannerImageURL,
                        in: namespace
                    )
            }
            .offset(x: 4)
            
            Spacer()
            
            Text(artist.artistName ?? "")
                .font(.headline)
                .multilineTextAlignment(.center)
                .lineLimit(3)
            
            Spacer()
        }
        .padding([.top, .horizontal])
    }
    
}

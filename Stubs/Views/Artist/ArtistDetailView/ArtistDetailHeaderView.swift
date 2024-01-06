//
//  ArtistDetailHeaderView.swift
//  Stubs
//
//  Created by christian on 1/5/24.
//

import SwiftUI

struct ArtistDetailHeaderView: View {
    let artist: ArtistService.Artist
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                
                
                AsyncImage(
                    url: URL(
                        string: artist.strArtistFanart2 ?? ""
                    )
                ) { bannerImage in
                    
                    ArtistDetailHeaderImage(
                        image: bannerImage,
                        genre: artist.strGenre ?? "",
                        country: artist.strCountry ?? ""
                    )
                    
                } placeholder: {
                    
                    Rectangle()
                        .foregroundStyle(.secondary)
                }
                .frame(width: geo.size.width, height: geo.size.width * 0.4 )
                
                Spacer()
            }
        }
    }
}

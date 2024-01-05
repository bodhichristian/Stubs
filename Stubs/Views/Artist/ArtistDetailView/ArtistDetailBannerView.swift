//
//  ArtistDetailBannerView.swift
//  Stubs
//
//  Created by christian on 1/5/24.
//

import SwiftUI

struct ArtistDetailBannerView: View {
    let artist: ArtistService.Artist
    
    @State private var imageOpacity = 0.0

    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .bottomTrailing) {
                AsyncImage(
                    url: URL(
                        string: artist.strArtistFanart2 ?? ""
                    )
                ) { bannerImage in
                    bannerImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width, height: geo.size.width * 0.4)
                        .clipShape(Rectangle())
                        .opacity(imageOpacity)
                        .overlay {
                            LinearGradient(
                                colors: [.clear, .black],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                            .opacity(0.6)
                        }
                    
                } placeholder: {
                    
                    Rectangle()
                    
                }
                
                // Genre & Location
                VStack(alignment: .trailing) {
                    
                    Text(artist.strGenre ?? "")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Text(artist.strCountry ?? "")
                    
                }
                
                .foregroundStyle(.white)
                .padding()
            }
        }
    }
}


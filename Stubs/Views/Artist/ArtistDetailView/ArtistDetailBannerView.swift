//
//  ArtistDetailBannerView.swift
//  Stubs
//
//  Created by christian on 1/5/24.
//

import SwiftUI

// TODO: After extracting ArtistDetailBanner View, banner images are not loading on screen

struct ArtistDetailBannerView: View {
    let image: Image
    
    @State private var imageOpacity = 0.0

    var body: some View {
        GeometryReader { geo in
            image
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
            
        }
        }
}


//
//  ArtistDetailHeaderView.swift
//  Stubs
//
//  Created by christian on 1/5/24.
//

import SwiftUI

struct ArtistDetailBannerView: View {
    let artist: Artist
    let showingFullBio: Bool
    
    @Environment(\.horizontalSizeClass) var sizeClass
    
    private var bannerImage: UIImage {
        if let data = artist.bannerImageData {
            return UIImage(data: data) ?? UIImage()
        } else {
            return UIImage()
        }
    }
    
    var body: some View {
        GeometryReader { geo in
            VStack { // Outer Stack
                Image(uiImage: bannerImage)
                    .resizable()
                    .scaledToFill()
                    .frame(
                        width: geo.size.width,
                        height: sizeClass == .compact
                        ? showingFullBio
                        ? geo.size.height * 1.05
                        : geo.size.height * 0.25
                        : geo.size.height * 1.05,
                        alignment: .top
                    )
                
                    .clipShape(Rectangle())
                    .overlay {
                        LinearGradient(
                            colors: [.clear, .black],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        .opacity(0.6)
                    }
  
                if sizeClass == .compact{
                    Spacer() // Push bannerImage to top
                }
            }
            .ignoresSafeArea(edges:.bottom)
        }
        
    }
}


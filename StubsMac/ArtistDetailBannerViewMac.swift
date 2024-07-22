//
//  ArtistDetailBannerViewMac.swift
//  StubsMac
//
//  Created by christian on 7/22/24.
//

import SwiftUI

struct ArtistDetailBannerViewMac: View {
    let artist: Artist
    let showingFullBio: Bool
    
    @Environment(\.horizontalSizeClass) var sizeClass
    
    private var bannerImage: NSImage {
        if let data = artist.bannerImageData {
            return NSImage(data: data) ?? NSImage()
        } else {
            return NSImage()
        }
    }
    
    var body: some View {
        GeometryReader { geo in
            VStack { // Outer Stack
                Image(nsImage: bannerImage)
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


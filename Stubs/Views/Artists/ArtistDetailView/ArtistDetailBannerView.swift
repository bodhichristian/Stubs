//
//  ArtistDetailHeaderView.swift
//  Stubs
//
//  Created by christian on 1/5/24.
//

import SwiftUI

struct ArtistDetailBannerView: View {
    let artist: Artist
    
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
                ZStack(alignment: .bottomTrailing){
                    Image(uiImage: bannerImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width, height: geo.size.width * 0.4)
                        .clipShape(Rectangle())
                        .overlay {
                            LinearGradient(
                                colors: [.clear, .black],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                            .opacity(0.6)
                        }
                    
                    // Genre & Location
                    VStack(alignment: .trailing) {
                        HStack {
                            Text("\(artist.mood ?? "") ")
                            Text(artist.genre ?? "")
                        }
                            .font(.title3)
                            .fontWeight(.semibold)
                        Text(artist.geo ?? "")
                        
                    }
                    .foregroundStyle(.white)
                    .padding(.trailing)
                    .padding(.bottom, 10)
                }

                Spacer() // Push bannerImage to top
            }
        }
        
    }
}


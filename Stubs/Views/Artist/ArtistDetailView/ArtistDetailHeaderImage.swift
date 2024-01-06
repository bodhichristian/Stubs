//
//  ArtistDetailBannerView.swift
//  Stubs
//
//  Created by christian on 1/5/24.
//

import SwiftUI

// TODO: After extracting ArtistDetailBanner View, banner images are not loading on screen

struct ArtistDetailHeaderImage: View {
    let image: Image
    let genre: String
    let country: String
    
    @State private var imageOpacity = 0.0
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .bottomTrailing){
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
                    .onAppear {
                        withAnimation(.easeInOut(duration: 0.5)){
                            imageOpacity = 1.0
                        }
                    }
                
                // Genre & Location
                VStack(alignment: .trailing) {
                    
                    Text(genre)
                        .font(.title3)
                        .fontWeight(.semibold)
                    Text(country)
                    
                }
                .foregroundStyle(.white)
                .padding()
            }
        }
    }
}


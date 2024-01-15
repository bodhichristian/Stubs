//
//  ArtistDetailProfileImage.swift
//  Stubs
//
//  Created by christian on 1/5/24.
//

import SwiftUI

struct ArtistDetailProfileImage: View {
    let artist: Artist
    
    let width: CGFloat
    @State private var imageOpacity = 0.0
    
    var body: some View {
        AsyncImage(url: URL(string: artist.strArtistThumb ?? "")) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(width: width)
                .clipShape(Circle())
                .opacity(imageOpacity)
                //.shadow(radius: 5,  y: width * 0.07)
                .padding(.horizontal, 10)
                .onAppear {
                    withAnimation(.easeInOut(duration: 1.5)){
                        imageOpacity = 1.0
                    }
                }
            
        } placeholder: {
            
            Circle()
                .foregroundStyle(.gray)
                .frame(width: width)
                .padding()
            
        }
    }
}

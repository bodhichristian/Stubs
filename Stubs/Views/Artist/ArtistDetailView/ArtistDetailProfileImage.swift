//
//  ArtistDetailProfileImage.swift
//  Stubs
//
//  Created by christian on 1/5/24.
//

import SwiftUI

struct ArtistDetailProfileImage: View {
    let artist: Artist
    
    private let artistImageWidth: CGFloat = 100
    @State private var imageOpacity = 0.0
    
    var body: some View {
        AsyncImage(url: URL(string: artist.strArtistThumb ?? "")) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(width: artistImageWidth)
                .clipShape(Circle())
                .opacity(imageOpacity)
                .shadow(radius: 7,  y: 7)
                .padding()
                .onAppear {
                    withAnimation(.easeInOut(duration: 1.5)){
                        imageOpacity = 1.0
                    }
                }
            
        } placeholder: {
            
            Circle()
                .foregroundStyle(.gray)
                .frame(width: artistImageWidth)
                .padding()
            
        }
    }
}

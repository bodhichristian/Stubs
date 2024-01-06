//
//  ArtistDetailHeaderView.swift
//  Stubs
//
//  Created by christian on 1/5/24.
//

import SwiftUI

struct ArtistDetailHeaderView: View {
    let imageURL: String
    
    let genre: String
    let country: String
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                
                
                AsyncImage(
                    url: URL(
                        string: imageURL
                    )
                ) { bannerImage in
                    
                    ArtistDetailHeaderImage(
                        image: bannerImage,
                        genre: genre,
                        country: country 
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

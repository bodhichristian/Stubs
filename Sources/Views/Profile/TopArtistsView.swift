//
//  TopArtistsView.swift
//  Stubs
//
//  Created by christian on 8/3/24.
//

import SwiftUI

struct TopArtistsView: View {
    let artists: [Artist]
    
    var body: some View {
        VStack {
            Text("Top Artists")
                .font(.title3)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ForEach(Array(artists.enumerated()), id: \.element.id) { index, artist in
                
                
                HStack {
                    ArtistImageView(imageData: artist.artistImageData)
                        .frame(width: 44)
                    
                    Text("\(index + 1)")
                        .fontWeight(.bold)
                    
                    Text(artist.artistName ?? "")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Group {
                        if let count = artist.concerts?.count {
                            if count > 1 {
                                Text("\(count + 1) Stubs")
                            } else {
                                Text("\(count + 1) Stub")
                            }
                        }
                    }
                        .foregroundStyle(.secondary)
                }
            }
        }
        .padding(.bottom)
    }
}

#Preview {
    TopArtistsView(artists: [Artist]())
}

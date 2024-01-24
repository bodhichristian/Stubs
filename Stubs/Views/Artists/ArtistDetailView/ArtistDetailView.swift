//
//  ArtistDetailView.swift
//  Stubs
//
//  Created by christian on 12/28/23.
//

import MapKit
import SwiftData
import SwiftUI

struct ArtistDetailView: View {
    let artist: Artist
    
    @Environment(\.dismiss) var dismiss
    @Query var concerts: [Concert]
    
    
    // MARK: Formatting
    // Toggle to disbale lineLimit
    @State private var showingFullBio = false
    
    // Provide sizing for artistImage and placeholder
    private let artistImageWidth: CGFloat = 100
    
    // MARK: Computed props
    private var filteredConcerts: [Concert] {
        return concerts.filter({$0.artistName == artist.artistName })
    }
    
    private var artistImage: UIImage {
        if let data = artist.artistImageData {
            return UIImage(data: data) ?? UIImage()
        } else {
            return UIImage()
        }
    }
    

    
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                ArtistDetailBannerView(artist: artist)
                
                VStack(alignment: .leading, spacing: 0) {
                    HStack(alignment: .bottom) {
                        ZStack { // artist image
                            Circle()
                                .foregroundStyle(.gray)
                                .frame(width: artistImageWidth)
                                .padding()

                                Image(uiImage: artistImage)
                                .resizable()
                                .scaledToFit()
                                .frame(width: artistImageWidth)
                                .clipShape(Circle())
                                .shadow(radius: 7,  y: 7)
                                .padding()
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .trailing, spacing: 0){
                            Text("Bio")
                                .font(.title2.bold())
                                .padding(.trailing)
                            
                            // MARK: More/Less Button
                            // Toggle `lineLimit` to display a brief or full bio
                            Button {
                                showingFullBio.toggle()
                            } label: {
                                HStack {
                                    Text(
                                        showingFullBio
                                        ? "Less"
                                        : "More"
                                    )
                                    
                                    Image(
                                        systemName: showingFullBio
                                        ? "chevron.up"
                                        : "chevron.down"
                                    )
                                }
                                .font(.caption)
                                .padding(.horizontal)
                            }
                            .foregroundStyle(.gray)
                        }
                        .offset(y: -16)
                    }
                    .padding(.top, geo.size.width / 4)
                    
                    ScrollView {
                        Text(artist.bio ?? "")
                            .lineLimit(showingFullBio ? .none : 3)
                            .padding([.horizontal, .bottom])
                        
                        ArtistDetailVenuesMap(concerts: filteredConcerts)
                        
                        AlbumScrollView(artistID: artist.artistID ?? "")
                            .padding(.bottom, 50)
                    }
                }
            }
            .navigationTitle(artist.artistName ?? "")
        }
    }
}

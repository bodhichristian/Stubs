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
    @State private var imageOpacity = 0.0
    @State private var showingFullBio = false
    private let artistImageWidth: CGFloat = 100
    
    private var filteredConcerts: [Concert] {
        return concerts.filter({$0.artistName == artist.strArtist })
    }
    
    
    
    var body: some View {
        
        GeometryReader { geo in
            
            ZStack {
                
                ArtistDetailHeaderView(imageURL: artist.strArtistFanart2 ?? "", genre: artist.strGenre ?? "", country: artist.strCountry ?? "")
                
                
                
                VStack(alignment: .leading, spacing: 0) {
                    
                    HStack(alignment: .bottom) {
                        ZStack { // artist image
                            
                            Circle()
                                .foregroundStyle(.gray)
                                .frame(width: artistImageWidth)
                                .padding()
                            
                            
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
                        
                        Text(artist.strBiographyEN ?? "")
                            .lineLimit(showingFullBio ? .none : 3)
                            .padding([.horizontal, .bottom])
                        
                        ArtistDetailVenuesMap(concerts: filteredConcerts)
                        
                        AlbumScrollView(artist: artist.strArtist ?? "")
                    }
                }
            }
            .navigationTitle(artist.strArtist ?? "")
            

        }
    }
}

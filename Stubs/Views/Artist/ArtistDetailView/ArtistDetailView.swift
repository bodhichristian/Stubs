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
    let artist: String
    
    @Environment(\.dismiss) var dismiss
    @Query var concerts: [Concert]
    @State private var model = ArtistService()
    
    // MARK: Formatting
    @State private var imageOpacity = 0.0
    @State private var showingFullBio = false
    private let artistImageWidth: CGFloat = 100
    
    private var filteredConcerts: [Concert] {
        return concerts.filter({$0.artist == artist })
    }
    
    var body: some View {
        
        GeometryReader { geo in
            
            ZStack {
                
                VStack { // banner layer
                    
                    ZStack(alignment: .bottomTrailing) { // banner image
                        
                        Rectangle() // base layer
                        
                        // if the artist search has received a response
                        // create `artist` object using the first item in the array
                        if let artist = model.artists.first {
                            AsyncImage(
                                url: URL(
                                    string: artist.strArtistFanart2 ?? ""
                                )
                            ) { bannerImage in
                                
                               ArtistDetailBannerView(image: bannerImage)
                                
                            } placeholder: {
                                
                                Rectangle()
                            }
                            
                            // Genre & Location
                            VStack(alignment: .trailing) {
                                
                                Text(artist.strGenre ?? "")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                Text(artist.strCountry ?? "")
                                
                            }
                            
                            .foregroundStyle(.white)
                            .padding()
                        }
                        
                    }
                    // banner image frame
                    .frame(width: geo.size.width, height: geo.size.width * 0.4 )
                    
                    Spacer()
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    
                    HStack(alignment: .bottom) {
                        ZStack { // artist image
                            
                            Circle()
                                .foregroundStyle(.gray)
                                .frame(width: artistImageWidth)
                                .padding()
                            
                            if let artist = model.artists.first {
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
                        
                        if let artist = model.artists.first {
                            
                            Text(artist.strBiographyEN ?? "")
                                .lineLimit(showingFullBio ? .none : 3)
                                .padding([.horizontal, .bottom])
                        }
                        
                        ArtistDetailVenuesMap(concerts: filteredConcerts)
                        
                        AlbumScrollView(artist: artist)
                    }
                }
                
                
            }
            .navigationTitle(artist)
            .onAppear {
                withAnimation(.bouncy){
                    model.search(for: artist)
                }
            }
        }
    }
}

#Preview {
    ArtistDetailView(artist: SampleData.concerts[0].artist)
}

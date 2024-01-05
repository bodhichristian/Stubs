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
    
    private var filteredConcerts: [Concert] {
        return concerts.filter({$0.artist == artist })
    }
    
    var body: some View {
        
        GeometryReader { geo in
            
            ZStack {
                
                VStack { // banner layer
                    
                    ZStack(alignment: .bottomTrailing) { // banner image
                        
                        Rectangle() // base layer
                        
                        // If the search response has been received,
                        // and a valid URL is found
                        if let artist = model.artists.first,
                           let url = URL(string: artist.strArtistFanart2 ?? "") {
                            ArtistDetailBannerView(artist: artist)
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
                                .frame(width: 100)
                                .padding()
                            
                            if let artist = model.artists.first {
                                
                                ArtistDetailProfileImage(artist: artist)
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

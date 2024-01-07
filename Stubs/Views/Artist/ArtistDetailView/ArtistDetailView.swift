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
    let artistName: String
    
    
    @Environment(\.dismiss) var dismiss
    @Query var concerts: [Concert]
    
    @State private var model = ArtistService()
    
    // MARK: Formatting
    @State private var imageOpacity = 0.0
    @State private var showingFullBio = false
    private let artistImageWidth: CGFloat = 100
    
    private var filteredConcerts: [Concert] {
        return concerts.filter({$0.artistName == artistName })
    }
    
    
    
    var body: some View {
        
        GeometryReader { geo in
            
            ZStack {
                
                ArtistDetailHeaderView(imageURL: model.singleArtistSearchResponse.first?.strArtistFanart2 ?? "", genre: model.singleArtistSearchResponse.first?.strGenre ?? "", country: model.singleArtistSearchResponse.first?.strCountry ?? "")
                
                
                
                VStack(alignment: .leading, spacing: 0) {
                    
                    HStack(alignment: .bottom) {
                        ZStack { // artist image
                            
                            Circle()
                                .foregroundStyle(.gray)
                                .frame(width: artistImageWidth)
                                .padding()
                            
                            
                            AsyncImage(url: URL(string: model.singleArtistSearchResponse.first?.strArtistThumb ?? "")) { image in
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
                        
                        Text(model.singleArtistSearchResponse.first?.strBiographyEN ?? "")
                            .lineLimit(showingFullBio ? .none : 3)
                            .padding([.horizontal, .bottom])
                        
                        ArtistDetailVenuesMap(concerts: filteredConcerts)
                        
                        AlbumScrollView(artist: model.singleArtistSearchResponse.first?.strArtist ?? "")
                    }
                }
            }
            .navigationTitle(artistName)
            .onAppear {
                model.search(for: artistName)
            }
        }
    }
}

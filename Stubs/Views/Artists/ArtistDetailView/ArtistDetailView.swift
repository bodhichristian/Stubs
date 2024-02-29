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
    @Environment(\.horizontalSizeClass) var sizeClass
    @Namespace var namespace
    @Query var concerts: [Concert]
    
    @State private var artistImageWidth: CGFloat = 120
    @State private var showingFullBio = false
    
    private var filteredConcerts: [Concert] {
        return concerts.filter {
            $0.artistName == artist.artistName
        }
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
                if !showingFullBio{
                    ArtistDetailBannerView(artist: artist)
                        .transition(.asymmetric(insertion: .push(from: .top), removal: .push(from: .bottom)))
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    HStack(alignment: .bottom) {
                        ZStack { // artist image
                            Image(uiImage: artistImage)
                                .resizable()
                                .scaledToFit()
                                .frame(width: artistImageWidth)
                                .clipShape(Circle())
                                .shadow(radius: 7,  y: 7)
                                .padding()
                                .offset(y: showingFullBio ? -80 : 0)
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .trailing, spacing: 0){
                            Text("Bio")
                                .font(.title2.bold())
                                .padding(.trailing)
                                .offset(y: showingFullBio ? 0 : 6)
                            
                            // MARK: More/Less Button
                            // Toggle `lineLimit` to display a brief or full bio
                            if showingFullBio {
                                Button {
                                    withAnimation {
                                        showingFullBio.toggle()
                                    }
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
                                .foregroundStyle(.secondary)
                                .matchedGeometryEffect(id: "moreLess", in: namespace)
                            }
                            
                        }
                        .offset(y: showingFullBio ? -80 : -16)
                        
                    }
                    .padding(.top, geo.size.width / 6)
                    
                    ScrollView {
                        VStack(spacing: 4) {
                            Text(artist.bio ?? "")
                                .lineLimit(showingFullBio ? .none : 2)
                                .padding(.horizontal)
                                
                                .frame(width: geo.size.width)
                            
                            HStack {
                                Spacer()
                                // MARK: More/Less Button
                                // Toggle `lineLimit` to display a brief or full bio
                                if !showingFullBio {
                                    Button {
                                        withAnimation{
                                            showingFullBio.toggle()
                                        }
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
                                        .font(.caption.bold())
                                        .padding(.horizontal)
                                    }
                                    .foregroundStyle(.secondary)
                                    .matchedGeometryEffect(id: "moreLess", in: namespace)
                                }
                            }
                            AlbumScrollView(artistID: artist.artistID ?? "")
                                .padding(.top, 4)
                            ArtistDetailVenuesMap(concerts: filteredConcerts)
                            
                           
                        }
                    }
                    .offset(y: showingFullBio ? -80 : 0)
                    .padding(.bottom, 60)
                }
            }
            
            .navigationTitle(artist.artistName ?? "")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

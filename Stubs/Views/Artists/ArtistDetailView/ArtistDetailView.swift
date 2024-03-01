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
    
    @Environment(\.colorScheme) var colorScheme
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
    
    private var bioFontColor: Color {
        if !showingFullBio && colorScheme == .light {
          return .white
        } else {
            return .primary
        }
    }
    
    var body: some View {
        GeometryReader { geo in
            
            ZStack { // base
                if !showingFullBio{
                    ArtistDetailBannerView(artist: artist)
                        .transition(.asymmetric(insertion: .push(from: .top), removal: .push(from: .bottom)))
                }
                
                // detail stack
                VStack(alignment: .leading, spacing: 0) {
                    
                    // bio stack
                    VStack(alignment: .leading, spacing: 0){
                        
                        // MARK: More/Less Button
                        // Toggle `lineLimit` to display a brief or full bio
                        if showingFullBio {
                            FullBioToggle(showingFullBio: $showingFullBio)
                                .foregroundStyle(.secondary)
                                .matchedGeometryEffect(id: "moreLess", in: namespace)
                        }
                        
                    }
                    
                    .padding(
                        .top,
                        showingFullBio
                        ? 10
                        : sizeClass == .compact
                        ? geo.size.height * 0.28
                        : geo.size.height * 0.6
                    )
                    
                    ScrollView {
                        VStack(spacing: 4) {
                            Text(artist.bio ?? "")
                                .lineLimit(showingFullBio ? .none : 2)
                                .padding(.horizontal)
                                .frame(width: geo.size.width)
                                .foregroundStyle(bioFontColor)
                            
                            HStack {
                                Spacer()
                                // MARK: More/Less Button
                                // Toggle `lineLimit` to display a brief or full bio
                                if !showingFullBio {
                                    FullBioToggle(showingFullBio: $showingFullBio)
                                        .foregroundStyle(.secondary)
                                        .matchedGeometryEffect(id: "moreLess", in: namespace)
                                }
                            }
                            AlbumScrollView(artistID: artist.artistID ?? "")
                                .padding(.top, 4)
                            ArtistDetailVenuesMap(concerts: filteredConcerts)
                            
                            
                        }
                    }
                    //.offset(y: showingFullBio ? -80 : 0)
                    .padding(.bottom, 60)
                }
            }
            
            .navigationTitle(artist.artistName ?? "")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

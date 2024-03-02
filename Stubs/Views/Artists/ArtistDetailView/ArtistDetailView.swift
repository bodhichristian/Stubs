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
    @State private var materialOpacity: CGFloat = 0
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
    
//    private var bioFontColor: Color {
//        if !showingFullBio && colorScheme == .light {
//            return .white
//        } else {
//            return .primary
//        }
//    }
    
    var body: some View {
        GeometryReader { geo in
            ArtistDetailBannerView(artist: artist)
            
            Rectangle()
                .foregroundStyle(.ultraThinMaterial)
                .opacity(showingFullBio ? 1 : materialOpacity)
                .ignoresSafeArea()
            
            
            // detail stack
            VStack(alignment: .leading, spacing: 0) {
                
                ScrollView {
                    GeometryReader { scrollViewGeo in
                        Color.clear.preference(key: ScrollOffsetPreferenceKey.self,
                                               value: scrollViewGeo.frame(in: .named("scrollView")).minY)
                    }
                    if showingFullBio {
                        FullBioToggle(showingFullBio: $showingFullBio)
                            .foregroundStyle(.secondary)
                    }
                    VStack(spacing: 4) {
                        Text(artist.bio ?? "")
                            .lineLimit(showingFullBio ? .none : 2)
                            .padding(.horizontal)
                            .frame(width: geo.size.width)
                            .foregroundStyle(.primary)
                        
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
                    .padding(
                        .top,
                        showingFullBio
                        ? 10
                        : sizeClass == .compact
                        ? geo.size.height * 0.25
                        : geo.size.height * 0.57
                    )
                    
                }
                .padding(.bottom, 60)
                .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                    updateMaterialOpacity(with: value, outerHeight: geo.size.height)
                }
            }
            
            .navigationTitle(artist.artistName ?? "")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
    private func updateMaterialOpacity(with scrollOffset: CGFloat, outerHeight: CGFloat) {
        // Assuming the content height is significantly larger than the outerHeight,
        // adjust these calculations if your UI layout is different.
        let normalizedOffset = min(max(-scrollOffset / (outerHeight * 0.5), 0), 1)
        self.materialOpacity = normalizedOffset
    }
}

struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}

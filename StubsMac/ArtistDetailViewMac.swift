//
//  ArtistDetailViewMac.swift
//  StubsMac
//
//  Created by christian on 7/22/24.
//

import SwiftUI
import SwiftData

struct ArtistDetailViewMac: View {
    let artist: Artist
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    @Environment(\.horizontalSizeClass) var sizeClass
    @Namespace var namespace
    
    @State private var artistImageWidth: CGFloat = 120
    @State private var materialOpacity: CGFloat = 0
    @State private var showingFullBio = false
    
    
    private var artistImage: NSImage {
        if let data = artist.artistImageData {
            return NSImage(data: data) ?? NSImage()
        } else {
            return NSImage()
        }
    }
    
    var body: some View {
        ZStack {
            Image(nsImage: artistImage)
                .resizable()
                .scaledToFill()
                .overlay {
                    //LinearGradient(colors: [.black.opacity(0.0), .black], startPoint: .center, endPoint: .bottom)
                    
                    Rectangle()
                        .foregroundStyle(.ultraThinMaterial)
                }
            
            VStack {
                Text(artist.artistName ?? "")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                
                    
                
            }
            
        }
    }

}

//struct ScrollOffsetPreferenceKey: PreferenceKey {
//    static var defaultValue: CGFloat = 0
//    
//    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
//        value += nextValue()
//    }
//}




//
//
//GeometryReader { geo in
//    ArtistDetailBannerViewMac(
//        artist: artist,
//        showingFullBio: showingFullBio
//    )
//    
//    Rectangle()
//        .foregroundStyle(.thinMaterial)
//        .opacity(showingFullBio ? 1 : materialOpacity)
//        .ignoresSafeArea()
//    
//    
//    // detail stack
//    VStack(alignment: .leading, spacing: 0) {
//        
//        ScrollView {
//            GeometryReader { scrollViewGeo in
//                Color.clear.preference(key: ScrollOffsetPreferenceKey.self,
//                                       value: scrollViewGeo.frame(in: .named("scrollView")).minY)
//            }
//            if showingFullBio {
//                FullBioToggle(showingFullBio: $showingFullBio)
//                    .foregroundStyle(.secondary)
//                    .matchedGeometryEffect(id: "moreLess", in: namespace)
//
//            }
//            VStack(spacing: 4) {
//                Group {
//                    if showingFullBio {
//                        Text(artist.bio ?? "")
//                            .fontWeight(.medium)
//                    } else {
//                        Text(artist.bio ?? "")
//                            .lineLimit(showingFullBio ? .none : 2)
//                    }
//                }
//                .multilineTextAlignment(.center)
//                .padding(.horizontal)
//                .frame(width: geo.size.width)
//                .foregroundStyle(.primary)
//                
//                HStack {
//                    Spacer()
//                    // MARK: More/Less Button
//                    // Toggle `lineLimit` to display a brief or full bio
//                    if !showingFullBio {
//                        FullBioToggle(showingFullBio: $showingFullBio)
//                            .foregroundStyle(.secondary)
//                            .matchedGeometryEffect(id: "moreLess", in: namespace)
//                    }
//                }
////                        if !showingFullBio {
////                            AlbumScrollView(artist: artist)
////                                .padding(.top, 4)
////                                .animation(.smooth, value: 10)
////
////                        }
////                        if let concerts = artist.concerts{
////                            ArtistDetailVenuesMap(concerts: concerts)
////                        }
//                
//                
//            }
//            .padding(
//                .top,
//                showingFullBio
//                ? 10
//                : sizeClass == .compact
//                ? geo.size.height * 0.25
//                : geo.size.height * 0.57
//            )
//            
//        }
//        .padding(.bottom, 60)
//        .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
//            updateMaterialOpacity(with: value, outerHeight: geo.size.height)
//        }
//    }
//    
//    .navigationTitle(artist.artistName ?? "")
//    //.navigationBarTitleDisplayMode(.inline)
//    
//}
//
//
//
//
//
//private func updateMaterialOpacity(with scrollOffset: CGFloat, outerHeight: CGFloat) {
//    // Assuming the content height is significantly larger than the outerHeight,
//    // adjust these calculations if your UI layout is different.
//    let normalizedOffset = min(max(-scrollOffset / (outerHeight * 0.5), 0), 1)
//    self.materialOpacity = normalizedOffset
//}

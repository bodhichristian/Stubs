//
//  ArtistGridView.swift
//  Stubs
//
//  Created by christian on 3/2/24.
//

import SwiftUI

struct ArtistGridView: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    
    let artists: [Artist]
    let listView: Bool
    let namespace: Namespace.ID
    
    private var columns: [GridItem] {
        [GridItem(
            .adaptive(
                minimum: sizeClass == .compact
                ? 120
                : 180
            )
        )]
    }
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(artists, id: \.artistID) { artist in
                NavigationLink {
                    ArtistDetailView(artist: artist)
                } label: {
                    ZStack {
                        ArtistTile(
                            artist: artist,
                            listView: listView
                        )
                        .matchedGeometryEffect(
                            id: artist.artistImageURL,
                            in: namespace
                        )
                        
                        ArtistGridItemLabel(
                            artist: artist,
                            namespace: namespace
                        )
                    }
                }
                .frame(minHeight: 150)
                .buttonStyle(PlainButtonStyle())
            }
        }
        .padding(.horizontal)
        .padding(.bottom, 65)
    }
}

//
//  ArtistsListView.swift
//  Stubs
//
//  Created by christian on 3/2/24.
//

import SwiftUI

struct ArtistListView: View {
    let artists: [Artist]
    let listView: Bool
    let namespace: Namespace.ID
    
    private let digits = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    var body: some View {
        LazyVStack {
            ForEach(artists, id: \.self) { artist in
                NavigationLink {
                    ArtistDetailView(artist: artist)
                } label: {
                    ZStack {
                        ArtistListRowLabel(
                            artist: artist,
                            listView: listView,
                            namespace: namespace
                        )
                    }
                }
                .buttonStyle(PlainButtonStyle())
                
            }
        }
        .accessibilityIdentifier("ArtistListView")
        .padding(.horizontal)
        .padding(.bottom, 100)
    }
    
}

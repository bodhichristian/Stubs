//
//  ArtistsListView.swift
//  Stubs
//
//  Created by christian on 3/2/24.
//

import SwiftUI

struct ArtistListView: View {
    let groupedArtists: [String: [Artist]]
    let sortedKeys: [String]
    let listView: Bool
    let namespace: Namespace.ID
    
    private let digits = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

    var body: some View {
        LazyVStack {
            ForEach(sortedKeys, id: \.self) { key in
                Section {
                    ForEach(groupedArtists[key] ?? [], id: \.artistID) { artist in
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
                } header: {
                    alphabetHeader(key)
                        .matchedGeometryEffect(
                            id: key,
                            in: namespace
                        )
                }
            }
        }
        .padding(.horizontal)
        .padding(.bottom, 100)
    }
    
    private func alphabetHeader(_ letter: String) -> some View {
        HStack {
            Text(digits.contains(letter) ? "#" : letter)
                .textCase(nil)
                .font(.title2)
                .bold()
                .foregroundStyle(.secondary)
            
            VStack {
                Divider()
            }
        }
        .padding(.vertical, 15)
    }
}

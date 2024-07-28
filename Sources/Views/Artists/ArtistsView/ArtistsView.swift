//
//  ArtistsView.swift
//  Stubs
//
//  Created by christian on 12/29/23.
//

import SwiftUI
import SwiftData
import TipKit

struct ArtistsView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.modelContext) var modelContext
    @Namespace var namespace
    
    @Query var artists: [Artist]
    
    @State private var artistImageWidth: CGFloat = 44
    @State private var listView = true
    @State private var searchPrompt = "Search Artists"
    @State private var searchText = ""
    @State private var sortOrder: SortOrder = .byNameAscending
    
    private let viewOptionsTip = ArtistsViewOptionsTip()
    private let artistsViewOptionsTip = ArtistsViewOptionsTip()
    
    private var uniqueArtists: [Artist] {
        Array(Set(artists))
    }
    
    private var filteredArtists: [Artist] {
        if searchText.isEmpty {
            return uniqueArtists
        } else {
            return uniqueArtists.filter { artist in
                if let artistName = artist.artistName {
                    return artistName.lowercased().contains(searchText.lowercased())
                } else {
                    return false
                }
            }
        }
    }
    
    private var sortedArtists: [Artist] {
        switch sortOrder {
        case .byNameAscending:
            return filteredArtists.sorted(by: {$0.artistName ?? ""  < $1.artistName ?? ""})
        case .byNameDescending:
            return filteredArtists.sorted(by: {$0.artistName ?? ""  > $1.artistName ?? ""})
        default:  return filteredArtists
        }
    }
    
    var body: some View {
        ZStack {
            NavigationStack {
                ScrollView {
                    TipView(artistsViewOptionsTip)
                    
                    if listView {
                        ArtistListView(
                            artists: sortedArtists,
                            listView: listView,
                            namespace: namespace
                        )
                        
                    } else {
                        ArtistGridView(
                            artists: sortedArtists,
                            listView: listView,
                            namespace: namespace
                        )
                    }
                }
                .accessibilityIdentifier("ArtistsScrollView")
                .navigationTitle("Artists")
                .searchable(
                    text: $searchText,
                    prompt: searchPrompt
                )
                .toolbar {
                    ToolbarItem {
                        ArtistMenuLabel(
                            artistImageWidth: $artistImageWidth,
                            listView: $listView,
                            sortOrder: $sortOrder
                        )
                        .accessibilityIdentifier("ViewOptionsButton")
                    }
                }
                .tint(.primary)
            }
        }
    }
}

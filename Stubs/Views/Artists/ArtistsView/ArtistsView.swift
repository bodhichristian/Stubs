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
    @Namespace var namespace
    
    @Query var artists: [Artist]
    
    @State private var artistImageWidth: CGFloat = 44
    @State private var listView = true
    @State private var searchPrompt = "Search Artists"
    @State private var searchText = ""
    @State private var sortOrder: SortOrder = .byNameAscending
    
    private let viewOptionsTip = ArtistsViewOptionsTip()
    private let artistsViewOptionsTip = ArtistsViewOptionsTip()
    
    private var filteredArtists: [Artist] {
        if searchText.isEmpty {
            return artists
        } else {
            return artists.filter { artist in
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
    
    private var groupedArtists: [String: [Artist]] {
        Dictionary(grouping: sortedArtists) { $0.artistName?.first?.uppercased() ?? "#" }
    }
    
    private var sortedKeys: [String] {
        switch sortOrder {
        case .byNameDescending:
            groupedArtists.keys.sorted().reversed()
        default:
            groupedArtists.keys.sorted()
        }
    }
    
    
    var body: some View {
        ZStack {
            NavigationStack {
                ScrollView {
                    TipView(artistsViewOptionsTip)
                    
                    if listView {
                        ArtistListView(
                            groupedArtists: groupedArtists,
                            sortedKeys: sortedKeys,
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
                        //.popoverTip(viewOptionsTip, arrowEdge: .top)
                    }
                }
                .tint(.primary)
            }
        }
    }
}

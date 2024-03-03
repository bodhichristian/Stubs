//
//  ArtistsView.swift
//  Stubs
//
//  Created by christian on 12/29/23.
//

// TODO: Find a way to load images in this view and pass to detail views. Currently artist images load here.

import SwiftUI
import SwiftData

struct ArtistsView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Namespace var namespace
    @Query var concerts: [Concert]
    
    @State private var artistImageWidth: CGFloat = 44
    @State private var listView = true
    @State private var searchPrompt = "Search Artists"
    @State private var searchText = ""
    @State private var sortOrder: SortOrder = .byNameAscending
    
    private let artistsViewOptionsTip = ArtistsViewOptionsTip()
    

    
    
    private var shadowColor: Color {
        if colorScheme == .dark {
            return Color(white: 0.9)
        } else {
            return .secondary
        }
    }
    
    private var artists: [Artist] {
        var artists = [Artist]()
        
        for concert in concerts {
            artists.append(concert.artist ?? Artist())
        }
        
        let uniqueArtists = Set(artists)
        let sortedArists = Array(uniqueArtists).sorted {
            $0.artistName ?? "" < $1.artistName ?? ""
        }
        return sortedArists
    }
    
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
        NavigationStack {
            ScrollView {
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
            .searchable(
                text: $searchText,
                prompt: searchPrompt
            )
            .navigationTitle("Artists")
            .toolbar {
                ToolbarItem {
                    Menu {
                        Button {
                            withAnimation(.snappy(duration: 0.5)) {
                                setImageWidth()
                                listView.toggle()
                            }
                        } label: {
                            Label(
                                listView
                                ? "Switch to Grid View"
                                : "Switch to List View",
                                systemImage: listView
                                ? "square.grid.2x2"
                                : "list.bullet"
                            )
                        }
                        
                        Section {
                            Button {
                                withAnimation(.snappy){
                                    sortOrder = .byNameAscending
                                }
                            } label: {
                                Label(
                                    "Sort by Name A-Z",
                                    systemImage: "a.square"
                                )
                            }
                            
                            Button {
                                withAnimation(.snappy){
                                    sortOrder = .byNameDescending
                                }
                            } label: {
                                Label(
                                    "Sort by Name Z-A",
                                    systemImage: "z.square"
                                )
                            }
                        }
                    } label: {
                        Image(systemName: "line.3.horizontal.circle")
                    }
                }
            }
        }
        
    }
    
    private func setImageWidth() {
        if artistImageWidth == 44 {
            artistImageWidth = 75
        } else {
            artistImageWidth = 44
        }
    }
}

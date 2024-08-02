//
//  ContentView.swift
//  Stubs
//
//  Created by christian on 12/14/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    
    @Query(sort: \Concert.date) var concerts: [Concert]
    @Query(sort: \Artist.artistName) var artists: [Artist]
    
    @State private var tabSelection: TabBarItem = .profile
    
    var body: some View {
        TabBarContainer(selection: $tabSelection){
            StubCollection(concerts: concerts)
                .tabBarItem(
                    tab: .stubs,
                    selection: $tabSelection
                )
            
            ArtistsView()
                .tabBarItem(
                    tab: .artists,
                    selection: $tabSelection
                )
            
            VenuesView()
                .tabBarItem(
                    tab: .venues,
                    selection: $tabSelection
                )
            
            ProfileView(concerts: concerts, artists: artists)
                .tabBarItem(
                    tab: .profile,
                    selection: $tabSelection
                )
        }
    }
}

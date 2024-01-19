//
//  ContentView.swift
//  Stubs
//
//  Created by christian on 12/14/23.
//

import SwiftUI

struct ContentView: View {
    @State private var tabSelection: TabBarItem = .stubs
    
    var body: some View {
        
        TabBarContainer(selection: $tabSelection){
            StubCollection()
                .tabBarItem(
                    tab: .stubs,
                    selection: $tabSelection
                )
            
            ArtistsView()
                .tabBarItem(
                    tab: .artists,
                    selection: $tabSelection
                )
            
            Text("Coming Soon")
                .tabBarItem(tab: .profile, selection: $tabSelection)
            
        }
    }
}

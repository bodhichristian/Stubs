//
//  ContentView.swift
//  Stubs
//
//  Created by christian on 12/14/23.
//

import SwiftUI

struct ContentView: View {
    @State private var tabSelection: TabBarItem = .home
    
    var body: some View {
        TabBarContainer(selection: $tabSelection){
            StubCollection()
        }
    }
}

#Preview {
    ContentView()
}

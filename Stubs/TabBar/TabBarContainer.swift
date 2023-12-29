//
//  TabBarContainer.swift
//  MaterialTabBar
//
//  Created by christian on 11/9/23.
//

import SwiftUI

struct TabBarContainer<Content: View>: View {
    let content: Content
    @Binding var selection: TabBarItem
    @State private var tabs: [TabBarItem] = []
    
    init(selection: Binding<TabBarItem>, 
         @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            content
                .ignoresSafeArea()
            MaterialTabBar(tabs: tabs, 
                           selection: $selection,
                           localSelection: selection)
        }
        .onPreferenceChange(TabBarItemPreferenceKey.self, perform: { value in
            self.tabs = value
        })
    }
}

#Preview {
    TabBarContainer(selection: .constant(.home)) {
        Color.blue
    }
}




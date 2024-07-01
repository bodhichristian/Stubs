//
//  Sidebarview.swift
//  StubsMac
//
//  Created by christian on 6/29/24.
//

import SwiftUI

struct Sidebarview: View {
    @Binding var selection: TabBarItem?
    
    var body: some View {
        List(selection: $selection) {
            ForEach(TabBarItem.allCases, id: \.self) { item in
                Label(item.title, systemImage: item.iconName)
            }
        }
    }
}

#Preview {
    Sidebarview(selection: .constant(.stubs))
}

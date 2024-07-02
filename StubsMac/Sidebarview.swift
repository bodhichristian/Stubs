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
        .safeAreaInset(edge: .bottom) {
            Button {
                // Access Profile
            } label: {
                Label("Profile", systemImage: "person.circle")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .keyboardShortcut(KeyEquivalent("n"), modifiers: [.shift, .command])
            .foregroundStyle(.blue)
            .buttonStyle(.borderless)
            .padding(.leading, 12)
            .padding(.bottom, 8)
        }
    }
}

#Preview {
    Sidebarview(selection: .constant(.stubs))
}

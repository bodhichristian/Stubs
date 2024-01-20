//
//  MaterialTabBar.swift
//  MaterialTabBar
//
//  Created by christian on 11/9/23.
//

import SwiftUI

struct MaterialTabBar: View {
    let tabs: [TabBarItem]
    let contentShape = RoundedRectangle(cornerRadius: 5)
    @Binding var selection: TabBarItem
    
    // For matchedGeometryEffect
    @State var localSelection: TabBarItem
    @Namespace private var namespace
    
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                ForEach(tabs, id: \.self) { tab in
                    tabView(tab: tab)
                    
                }
            }
            
            .background {
                contentShape
                    .foregroundStyle(.ultraThinMaterial)
            }
            .ignoresSafeArea(edges: .bottom)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: .secondary, radius: 5)
            .padding(.horizontal)
            .onChange(of: selection) { _, newValue in
                withAnimation(.bouncy(duration: 0.3)) {
                    localSelection = newValue
                }
            }
        }
    }
}

extension MaterialTabBar {
    private func tabView(tab: TabBarItem) -> some View {
        VStack {
            
            if tab == selection  {
                Image(systemName: tab.iconName)
                    .font(.subheadline)
                    .foregroundStyle(localSelection == tab ? .primary : .secondary)
                    .frame(height: 15)
                    .symbolEffect(.bounce , value: localSelection)

                    
            } else {
                Image(systemName: tab.iconName)
                    .font(.subheadline)
                    .foregroundStyle(localSelection == tab ? .primary : .secondary)
                    .frame(height: 15)
            }
            
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
                .foregroundStyle(localSelection == tab ? .primary : .secondary)
        }
        
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .background(
            ZStack {
                if localSelection == tab {
                    contentShape
                        .fill(tab.color.opacity(0.2))
                        .matchedGeometryEffect(id: "tabHighlighting", in: namespace)
                }
            }
        )
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(tab.title), tab")
        .accessibilityHint("Double tap to open the \(tab.title) tab")
        .contentShape(contentShape)
        .onTapGesture {
            switchToTab(tab)
        }
    }
    
    private func switchToTab(_ newTab: TabBarItem) {
        selection = newTab
    }
}



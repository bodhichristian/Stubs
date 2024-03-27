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
    @Environment(\.colorScheme) var colorScheme
    @Namespace private var namespace
    @State var localSelection: TabBarItem

    private var colors: [Color] {
        switch colorScheme{
        case .light:
            return [.white, .white, .white, .black]
        default:
            return [.white, .black, .black]
        }
    }
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
                    .background {
                        LinearGradient(colors: colors, startPoint: .bottom, endPoint: .top).opacity(0.7)
                    }
            }
            .ignoresSafeArea(edges: .bottom)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 5, y: 3)
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
                        .foregroundStyle(.secondary.opacity(0.2))
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



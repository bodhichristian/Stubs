//
//  FavoriteToggleLabel.swift
//  Stubs
//
//  Created by christian on 3/2/24.
//

import SwiftUI

struct FavoriteToggleLabel: View {
    let filteringFavorites: Bool
    
    @Environment(\.colorScheme) var colorScheme
    
    private var shadowColor: Color {
        if colorScheme == .dark {
            return Color(white: 0.9)
        } else {
            return .secondary
        }
    }
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundStyle(
                    LinearGradient(colors: [.orange, .yellow], startPoint: .leading, endPoint: .trailing).opacity(0.3)
                )
                

            Circle()
                .foregroundStyle(.ultraThinMaterial)
                .shadow(color: shadowColor, radius: 2)

            Image(
                systemName: filteringFavorites
                ? "checkmark.seal.fill"
                : "checkmark.seal"
            )
            .font(.caption)
            .foregroundStyle(
                filteringFavorites 
                ? .yellow
                : .primary
            )
        }
        .frame(height: 36)
        .padding(.trailing, -16)
    }
}

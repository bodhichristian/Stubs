//
//  FavoriteToggleLabel.swift
//  Stubs
//
//  Created by christian on 3/2/24.
//

import SwiftUI

struct FavoriteToggleLabel: View {
    let filteringFavorites: Bool
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundStyle(LinearGradient(colors: [.orange, .yellow], startPoint: .leading, endPoint: .trailing).opacity(0.3))
                .shadow(color: .primary.opacity(0.7),radius: 2)

            Circle()
                .foregroundStyle(.ultraThinMaterial)
            Image(
                systemName: filteringFavorites
                ? "checkmark.seal.fill"
                : "checkmark.seal"
            )
            .font(.caption)
            .foregroundStyle(.primary)
        }
        .frame(height: 36)
        .padding(.trailing, -16)
    }
}

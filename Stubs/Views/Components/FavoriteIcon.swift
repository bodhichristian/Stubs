//
//  FavoriteIcon.swift
//  Stubs
//
//  Created by christian on 12/17/23.
//

import SwiftUI

struct FavoriteIcon: View {
    var body: some View {
        Image(systemName: "checkmark.seal.fill")
            .font(.title3)
            .foregroundStyle(
                LinearGradient(
                    colors: [.orange, .yellow, .yellow, .yellow, .orange],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing)
            )
            .padding(2)
            .background {
                Circle()
                    .foregroundStyle(.white)
                    .shadow(radius: 4, y: 2)

            }
        
    }
}

#Preview {
    FavoriteIcon()
}

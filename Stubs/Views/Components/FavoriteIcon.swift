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
                    colors: [.orange, .yellow, .white],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing)
            )
            .padding(2)
            .background {
                Circle()
                    .foregroundStyle(.thickMaterial)
            }
            .frame(width: 66, height: 40, alignment: .bottomTrailing)
            .shadow(radius: 2, y: 2)
        
    }
}

#Preview {
    FavoriteIcon()
}

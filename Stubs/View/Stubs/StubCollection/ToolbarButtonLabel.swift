//
//  ToolBarButtonLabel.swift
//  Stubs
//
//  Created by christian on 3/2/24.
//

import SwiftUI

struct ToolbarButtonLabel: View {
    let text: String
    let symbol: String
    
    var body: some View {
        HStack {
            Text(text)

            Image(systemName: symbol)
                .symbolRenderingMode(.hierarchical)
        }
        .font(.caption)
        .padding(.leading, 2)
        .padding(.vertical, 7)
        .padding(.horizontal, 15)
        .frame(height: 36)
        .background {
            Capsule()
                .foregroundStyle(
                    LinearGradient(colors: [.red, .orange, .yellow], startPoint: .leading, endPoint: .trailing).opacity(0.3)
                )
                .shadow(color: .primary.opacity(0.5),radius: 2)

            Capsule()
                .foregroundStyle(.ultraThinMaterial)
            
        }
    }
}

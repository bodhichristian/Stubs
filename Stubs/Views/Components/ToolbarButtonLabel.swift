//
//  ToolBarButtonLabel.swift
//  Stubs
//
//  Created by christian on 3/2/24.
//

import SwiftUI
import TipKit

struct ToolbarButtonLabel: View {
    let text: String
    let symbol: String
    let colors: [Color]
    
    @Environment(\.colorScheme) var colorScheme
    
    private var tileBackgroundColor: Color {
        if colorScheme == .dark {
            return Color(white: 0.2)
        } else {
            return Color(white: 0.95)
        }
    }
    
    private var shadowColor: Color {
        if colorScheme == .dark {
            return Color(white: 0.9)
        } else {
            return .secondary
        }
    }
    
    var body: some View {
        HStack {
            Text(text)
            Spacer()
            
            Image(systemName: symbol)
                .symbolRenderingMode(.multicolor)
        }
        .font(.caption)
        .fontWeight(.medium)
        .padding(.leading, 2)
        .padding(.vertical, 7)
        .padding(.horizontal, 15)
        .frame(width: 132, height: 36)
        .background {
//            Capsule()
//                .foregroundStyle(
//                    LinearGradient(
//                        colors: colors,
//                        startPoint: .leading,
//                        endPoint: .trailing
//                    ).opacity(0.3)
//                )

            Capsule()
                .foregroundStyle(.ultraThinMaterial)
//                .shadow(color: shadowColor, radius: 2)
            
            Capsule()
                .stroke(style: StrokeStyle(lineWidth: 1))
                .foregroundStyle(.gray.gradient)

        }
    }
}

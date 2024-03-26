//
//  TileBase.swift
//  Stubs
//
//  Created by christian on 2/17/24.
//

import SwiftUI

struct TileBase: View {
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
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(.regularMaterial)
               // .shadow(color: shadowColor, radius: 2)
            
            RoundedRectangle(cornerRadius: 10)
                .stroke(style: StrokeStyle(lineWidth: 1))
                .foregroundStyle(.gray.gradient)
        }
    }
}

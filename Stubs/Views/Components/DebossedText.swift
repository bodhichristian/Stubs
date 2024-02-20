//
//  EmbossedText.swift
//  Stubs
//
//  Created by christian on 2/19/24.
//

import SwiftUI

struct DebossedText: View {
    
    var text: String
    var textColor: Color = .primary // Main text color, often matches the background for a subtle effect
    var shadowColor: Color = .black // Color for the shadow part of the deboss effect
    var highlightColor: Color = .white // Color for the highlight part of the deboss effect
    var depth: CGFloat = 0.8 // How far the deboss effect should appear to go
    
    var body: some View {
        ZStack {
            // Main Text for Background, matches the background color or is slightly off for a subtle look
            Text(text)
                .foregroundColor(textColor)
            
            // Shadow
            Text(text)
                .foregroundColor(shadowColor.opacity(0.5)) // Slightly transparent shadow
                .blur(radius: 0.8) // Soften the shadow a bit
                .offset(x: -depth, y: -depth) // Opposite direction compared to emboss
            
            // Highlight
            Text(text)
                .foregroundColor(highlightColor.opacity(0.8)) // Slightly transparent highlight for a soft effect
                .blur(radius: 0.5) // Soften the highlight a bit
                .offset(x: depth, y: depth) // Opposite direction compared to emboss
        }
    }
}

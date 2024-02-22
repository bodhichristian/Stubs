//
//  StubThumbnail.swift
//  Stubs
//
//  Created by christian on 12/17/23.
//

import SwiftUI

struct StubThumbnail: View {
    let concert: Concert
    
    var stubColor: Color {
        return Color(colorName: concert.accentColor)!
    }
    
    var body: some View {
        ZStack {
            StubShape()
                .foregroundStyle(stubColor)
                .shadow(radius: 6, y: 4)
            
            StubShape()
                .foregroundStyle(.thinMaterial)
            
            Image(systemName: concert.iconName)
                .resizable()
                .scaledToFit()
                .frame(height: 25)
                .foregroundStyle(.ultraThickMaterial)
                .opacity(0.6)
                .shadow(radius: 2, y: 2)
            
            HStack {
                VerticalLineBoundary()
                
                Spacer()
                
                VerticalLineBoundary()
            }
            .frame(maxWidth: 50)
        }
        .frame(maxWidth: 66, maxHeight: 40)
        .rotationEffect(Angle(degrees: -15))
        .padding(.trailing)
    }
}

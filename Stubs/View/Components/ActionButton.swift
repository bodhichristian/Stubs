//
//  ActionButton.swift
//  Stubs
//
//  Created by christian on 6/16/23.
//

import SwiftUI

struct ActionButton: View {
    @Environment(\.colorScheme) var colorScheme
    
    let titleKey: String
    let systemImage: String
    let accentColor: Color
    
    @Binding var concert: Concert
    
    let action: () -> () // Provide as trialing closure
    
    init(titleKey: String,
         systemImage: String,
         accentColor: Color,
         concert: Binding<Concert>,
         action: @escaping () -> ()) {
        self.titleKey = titleKey
        self.systemImage = systemImage
        self.accentColor = accentColor
        self._concert = concert
        self.action = action
    }
    
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
        
        GeometryReader { geo in
            
            Button {
                
                action() // Perform given function
                
            } label: {
                
                    
                    HStack {
                        
                        Image(systemName: systemImage)
                            .renderingMode(.template)
                            .foregroundColor(accentColor)
                            
                        Text(titleKey)
                            .foregroundColor(.primary)
                        
                    }
                    .font(.callout)
                    .fontWeight(.semibold)
                    .frame(height: geo.size.width * 0.4)
                    .frame(maxWidth: .infinity)
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(tileBackgroundColor)
                            .shadow(color: shadowColor, radius: 2)
                            .frame(maxHeight: 60)
                    }
                
            }
            .position(x: geo.size.width / 2, y: geo.size.height / 2)
            //.buttonStyle(.borderedProminent)
            //.tint(.secondary.opacity(0.2))
            
        }
        .frame(maxHeight: 60)
        
    }
}

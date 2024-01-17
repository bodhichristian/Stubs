//
//  ActionButton.swift
//  Stubs
//
//  Created by christian on 6/16/23.
//

import SwiftUI

struct ActionButton: View {
    
    let titleKey: String
    let systemImage: String
    let accentColor: Color
    
    @Binding var concert: Concert
    
    let action: () -> ()
    
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
                .frame(width: geo.size.width * 0.8, height: geo.size.width * 0.3)
                
            }
            .position(x: geo.size.width / 2, y: geo.size.height / 2)
            .buttonStyle(.borderedProminent)
            .tint(.secondary.opacity(0.2))
        }
        .frame(maxHeight: 80)
        
    }
}

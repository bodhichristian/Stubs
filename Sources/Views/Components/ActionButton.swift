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
                        .stroke(style: StrokeStyle(lineWidth: 1))
                        .foregroundStyle(.secondary)
                        .frame(maxHeight: 60)
                }
            }
            .buttonStyle(PlainButtonStyle())
            .position(x: geo.size.width / 2, y: geo.size.height / 2)
        }
        .frame(maxHeight: 60)
    }
}

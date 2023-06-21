//
//  ActionButton.swift
//  Stubs
//
//  Created by christian on 6/16/23.
//

import SwiftUI

struct ActionButton: View {
    let titleKey: String
    let defaultImageName: String
    let highlightedImageName: String?
    let accentColor: Color
    @Binding var concert: Concert

    let action: () -> ()

    init(titleKey: String, defaultImageName: String, highlightedImageName: String? = nil,accentColor: Color,concert: Binding<Concert>,action: @escaping () -> ()) {
            self.titleKey = titleKey
            self.defaultImageName = defaultImageName
            self.highlightedImageName = highlightedImageName
            self.accentColor = accentColor
            self._concert = concert
            self.action = action
        }
    
    var body: some View {
        Button { // Favorite toggle
            withAnimation(.interactiveSpring) {
                action()
            }
        } label: {
            Label(title: {
                Text(titleKey)
                .foregroundColor(.primary)
                .frame(width: 80)
            }, icon: {
                // If concert is Favorite
                Image(systemName: concert.isFavorite
                      // Display highlighted Image, nil coalescing to the non-optional default
                      ? highlightedImageName ?? defaultImageName
                      // Else, display defaul image
                      : defaultImageName)
                .renderingMode(.template)
                .foregroundColor(accentColor)
            } )
            .padding(5)
        }
        .buttonStyle(.borderedProminent)
        .tint(.secondary.opacity(0.1))
    }
}

#Preview {
    ActionButton(titleKey: "Favorite", defaultImageName: "checkmark", highlightedImageName: "checkmark.seal", accentColor: .yellow, concert: .constant(SampleData.concerts[0]), action: {})
}

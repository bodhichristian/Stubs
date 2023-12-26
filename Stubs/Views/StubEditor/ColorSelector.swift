//
//  ColorSelector.swift
//  Stubs
//
//  Created by christian on 6/13/23.
//

import SwiftUI

struct ColorSelector: View {
    @Binding var accentColor: String

    let colorOptions = StubStyle.colors

    var body: some View {
        Section("Ticket Color") {
            ScrollView(.horizontal){
                HStack(spacing: 20) {
                    ForEach(colorOptions, id: \.self) { color in
                        Button {
                            accentColor = color
                        } label: {
                            Circle()
                                .frame(width: 40)
                                .foregroundStyle(Color(colorName: color)!)
                        }
                    }
                }
            }
            .scrollTargetBehavior(.paging)
            .shadow(radius: 5, y: 3)
            .padding(.vertical, 10)
        }
    }
}

#Preview {
    ColorSelector(accentColor: .constant("blue"))
}

//
//  ColorSelector.swift
//  Stubs
//
//  Created by christian on 6/13/23.
//

import SwiftUI

struct ColorSelector: View {
    let colorOptions = Customizable.colors

    @Binding var accentColor: String
    
    var body: some View {
        Section("Accent Color") {
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
            .shadow(radius: 5, y: 8)
            .padding(.vertical, 10)
        }
    }
}

#Preview {
    ColorSelector(accentColor: .constant("blue"))
}

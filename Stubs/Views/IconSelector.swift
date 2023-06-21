//
//  IconSelector.swift
//  Stubs
//
//  Created by christian on 6/13/23.
//

import SwiftUI

struct IconSelector: View {
    @Binding var iconName: String
    @Binding var accentColor: String
    
    let iconOptions = Customizable.icons
    
    var body: some View {
        Section("Icon") {
            VStack {
                Image(systemName: iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .foregroundStyle(Color(colorName: accentColor)!)
                    .shadow(radius: 5, y: 8)
                
                ScrollView(.horizontal){
                    HStack(spacing: 20) {
                        ForEach(iconOptions, id: \.self) { icon in
                            Button {
                                iconName = icon
                            } label: {
                                Image(systemName: icon)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                            }
                        }
                    }
                    .foregroundStyle(.primary)
                }
                .scrollTargetBehavior(.paging)
                .padding(.vertical, 10)
            }
        }
    }
}

#Preview {
    IconSelector(iconName: .constant("guitars"), accentColor: .constant("blue"))
}




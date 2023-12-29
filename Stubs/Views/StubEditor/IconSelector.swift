//
//  IconSelector.swift
//  Stubs
//
//  Created by christian on 6/13/23.
//

import SwiftUI

struct IconSelector: View {
    let iconOptions = StubStyle.icons
    
    @State private var iconTapped = false // For animating icons

    @Binding var iconName: String
        
    var body: some View {
        Section("Icon") {

                ScrollView(.horizontal){ // Icon options
                    HStack(spacing: 20) {
                        ForEach(iconOptions, id: \.self) { icon in
                            Button {
                                iconName = icon
                                iconTapped.toggle()
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
                .scrollIndicators(.visible)
                .scrollTargetBehavior(.paging)
                .padding(.vertical, 10)
            
        }
    }
}

#Preview {
    IconSelector(iconName: .constant("guitars"))
}




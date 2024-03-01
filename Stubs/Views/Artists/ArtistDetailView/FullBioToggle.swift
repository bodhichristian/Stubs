//
//  FullBioToggle.swift
//  Stubs
//
//  Created by christian on 2/29/24.
//

import SwiftUI

struct FullBioToggle: View {
    @Binding var showingFullBio: Bool
    @Environment(\.colorScheme) var colorScheme
    
    private var fontColor: Color {
        if !showingFullBio && colorScheme == .light {
          return .white
        } else {
            return .secondary
        }
    }
    
    var body: some View {
        Button {
            withAnimation(.smooth){
                showingFullBio.toggle()
            }
        } label: {
            HStack {
                Text(
                    showingFullBio
                    ? "Less"
                    : "More"
                )
                
                Image(
                    systemName: showingFullBio
                    ? "chevron.up"
                    : "chevron.down"
                )
            }
            .font(.caption.bold())
            .foregroundStyle(fontColor)
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(showingFullBio ? .all : .horizontal)
        }
    }
}

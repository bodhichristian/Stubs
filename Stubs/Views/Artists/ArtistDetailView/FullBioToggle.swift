//
//  FullBioToggle.swift
//  Stubs
//
//  Created by christian on 2/29/24.
//

import SwiftUI

struct FullBioToggle: View {
    @Binding var showingFullBio: Bool
    
    var body: some View {
        Button {
            withAnimation{
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
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.horizontal)
        }
    }
}

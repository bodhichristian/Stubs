//
//  StubNavLabel.swift
//  Stubs
//
//  Created by christian on 12/17/23.
//

import SwiftUI

struct ArtistStubsLabel: View {
    let concert: Concert
    
    var body: some View {
        VStack(alignment: .leading) {
            StubThumbnail(concert: concert)
                .frame(minHeight: 60)
                .frame(width: 90)
                .offset(x: 8)
            
            Text(concert.city)
                .font(.headline)
                .bold()
            
            Text(concert.date.formatted(date: .numeric, time: .omitted))
                .font(.subheadline)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
        }
        .padding(10)
        .background {
            TileBase()
        }
    }
}

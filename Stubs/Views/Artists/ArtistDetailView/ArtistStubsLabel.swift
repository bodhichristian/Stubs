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
                .rotationEffect(Angle(degrees: 15))

                .frame(
                    width: 70,
                    height: 50
                )
            
            Text(concert.city)
                .font(.subheadline)
                .bold()
            
            Text(concert.date.formatted(date: .numeric, time: .omitted))
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
        }
        .padding(10)
        .background {
            TileBase()
        }
    }
}

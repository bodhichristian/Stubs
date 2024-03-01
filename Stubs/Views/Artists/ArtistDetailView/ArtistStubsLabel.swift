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
        ZStack{
            TileBase()
                .frame(height: 110)
            
            VStack(alignment: .center) {
                StubThumbnail(concert: concert)
                    .rotationEffect(Angle(degrees: 15))

                    .frame(
                        width: 90,
                        height: 50
                    )
                    .offset(x: 7)
                
                Text(concert.city)
                    .font(.subheadline)
                    .bold()
                
                Text(concert.date.formatted(date: .numeric, time: .omitted))
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.secondary)
            }
            .padding(10)
        }
       
    }
}

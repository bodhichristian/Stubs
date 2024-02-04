//
//  ConcertLabel.swift
//  Stubs
//
//  Created by christian on 6/8/23.
//

import SwiftUI

// MARK: ConcertLabel - SwiftUI View
// A View for previewing concert details

struct StubCollectionRowLabel: View {
    let concert: Concert
    
    var body: some View {
        HStack {
            ZStack(alignment: .bottomTrailing){
                StubThumbnail(concert: concert)
                    
                if concert.isFavorite {
                    FavoriteIcon()
                        .offset(x: -12, y: 12)
                }
            }
            
            VStack(alignment: .leading) {
                Text(concert.artistName)
                    .font(.title3)
                    .fontWeight(.semibold)
                
                Text(concert.venue)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundStyle(Color(colorName: concert.accentColor)!)
                
                HStack {
                    Text(concert.city)
                    
                    Text(concert.date.formatted(date: .abbreviated, time: .omitted))
                        .foregroundStyle(.secondary)
                }
                .font(.callout)

            }
            .lineLimit(1)
        }
    }
}









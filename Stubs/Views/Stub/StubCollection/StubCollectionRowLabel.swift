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
                        .offset(y: 12)
                        .font(.headline)
                }
            }
            
            VStack(alignment: .leading) {
                
                Text(concert.artistName)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(concert.venue)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundStyle(Color(colorName: concert.accentColor)!)
                
                Text(concert.city)
                    .font(.callout)
                
                Text(concert.date.formatted(date: .abbreviated, time: .omitted))
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .lineLimit(1)
        }
    }
}









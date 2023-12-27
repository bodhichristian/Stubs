//
//  ConcertLabel.swift
//  Stubs
//
//  Created by christian on 6/8/23.
//

import SwiftUI

// MARK: ConcertLabel - SwiftUI View
// A View for previewing concert details

struct ConcertRowLabel: View {
    let concert: Concert
    
    var body: some View {
        HStack {
            
            StubThumbnail(concert: concert)
                .overlay {
                    if concert.isFavorite {
                        FavoriteIcon()
                            .offset(y: 12)
                        
                    }
                }
            
            VStack(alignment: .leading) {
                
                Text(concert.artist)
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









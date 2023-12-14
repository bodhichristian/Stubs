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
            Image(systemName: concert.iconName)
                .resizable()
                .foregroundStyle(Color(colorName: concert.accentColor)!)
                .scaledToFit()
                .frame(width: 50, height: 50)
                .shadow(color: .black.opacity(0.3), radius: 3, y: 4)
                .padding(.leading, 6)
                .padding(.trailing, 12)
            
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









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
            
            //Color(colorName: concert.accentColor)!
            
            ZStack {
                
                StubShape()
                    .foregroundStyle(Color(colorName: concert.accentColor)!)
                
                HStack {
                    VerticalLineBoundary()
                    Spacer()
                    
                    Image(systemName: concert.iconName)
                        .resizable()
                        .foregroundStyle(.white)
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                    
                    Spacer()
                    VerticalLineBoundary()
                }
                .frame(maxWidth: 60)
            }
            .shadow(color: .black.opacity(0.3), radius: 3, y: 2)

            .rotationEffect(Angle(degrees: -15))

            .frame(width: 70, height: 49)
            .padding(.trailing)
            .overlay {
                if concert.isFavorite {
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundStyle(.yellow)
                        .shadow(radius: 4)
                        .frame(width: 70, height: 49, alignment: .bottomTrailing)
                        
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









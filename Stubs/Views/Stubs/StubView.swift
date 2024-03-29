//
//  StubView.swift
//  Stubs
//
//  Created by christian on 7/8/23.
//

import SwiftUI

struct StubView: View {
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @State private var iconTapped = false // For icon animation
    
    let concert: Concert

    private var stubColor: Color {
        return Color(colorName: concert.accentColor)!
    }
    var body: some View {
        GeometryReader { geo in
            ZStack {
                // MARK: Stub base
                StubShape()
                    .foregroundStyle(stubColor)
                    .shadow(radius: 6, y: 10)
                
                Image(uiImage: UIImage(data: concert.artist?.bannerImageData ?? Data()) ?? UIImage())
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: geo.size.width * 0.9, maxHeight: geo.size.height)
                    .clipShape(StubShape())
                
                StubShape()
                    .foregroundStyle(.thinMaterial)
                
                Image(systemName: concert.iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: geo.size.height * 0.7)
                    .foregroundStyle(.thinMaterial)
                    .opacity(0.6)
                
                // MARK: Ticket Stub Elements
                HStack {
                    VerticalLineBoundary() // Left Edge
                    
                    
                    Spacer()
                    
                    // MARK: Ticket Details
                    VStack {
                        // Artist Name
                        Text(concert.artistName)
                            .font(.system(size: 36))
                            .fontWeight(.bold)
                            .foregroundStyle(.primary)
                        // Venue Details
                        Text(concert.venue)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundStyle(.secondary)

                        // City
                        Text(concert.city)
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundStyle(.primary)
                        
                        // MARK: Concert Date
                        // Format: `Jun 9, 2023`
                        Text(concert.date.formatted(date: .long, time: .omitted))
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundStyle(.secondary)
                            .fontDesign(.monospaced)
                    }
                    .multilineTextAlignment(.center)

                    Spacer()
                    
                    VerticalLineBoundary() // Right Edge
                }
                .padding(.horizontal, geo.size.width * 0.05)
            }
            // Main ZStack
            .frame(
                width: horizontalSizeClass == .compact ? geo.size.width : geo.size.width * 0.5,
                height: geo.size.height * 0.9
            )
            .position(x: geo.size.width / 2, y: geo.size.height / 2 )
        }
        // Maximum height for GeometryReader
        .frame(maxWidth: 800, maxHeight: horizontalSizeClass == .compact ? 250 : 300)
        
       // .padding(.horizontal)

    }
}




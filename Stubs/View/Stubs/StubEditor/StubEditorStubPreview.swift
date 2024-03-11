//
//  StubEditorPreview.swift
//  Stubs
//
//  Created by christian on 12/26/23.
//

import SwiftUI

struct StubEditorStubPreview: View {
    let concert: Concert
    
    private var stubColor: Color {
        return Color(colorName: concert.accentColor)!
    }
    
    @State private var iconTapped = false
    
    var body: some View {
        GeometryReader { geo in
            
            ZStack{
                // MARK: Stub base
                StubShape()
                    .foregroundStyle(stubColor)
                    .shadow(radius: 6, y: 10)
                
                Image(uiImage: UIImage(data: concert.artist?.bannerImageData ?? Data()) ?? UIImage())
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: geo.size.height * 0.7)
                    .clipShape(StubShape())
                
                StubShape()
                    .foregroundStyle(.thinMaterial)
                
                Image(systemName: concert.iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 180)
                    .foregroundStyle(.ultraThinMaterial)
                    .opacity(0.5)
                
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
                .padding(.horizontal)
                
            }
            
            // Main ZStack
            .frame(width: geo.size.width, height: geo.size.width * 0.60)
            .position(x: geo.size.width / 2, y: geo.size.height / 2 )
        }
        // GeometryReader Frame
        .frame(height: 250)
        .frame(maxWidth: 800, maxHeight: 400)

    }
}

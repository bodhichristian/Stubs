//
//  StubView.swift
//  Stubs
//
//  Created by christian on 7/8/23.
//

import SwiftUI

// MARK: StubView - SwiftUI View
// A View that represents a ticket stub

struct StubView: View {
    let concert: Concert

    private var stubColor: Color {
        return Color(colorName: concert.accentColor)!
    }
    
    @State private var iconTapped = false // For icon animation

    var body: some View {
        GeometryReader { geo in
            ZStack {
                // MARK: Stub base
                StubShape()
                    .foregroundStyle(stubColor)
                    .shadow(radius: 6, y: 10)
                
                Image(uiImage: UIImage(data: concert.artist.bannerImageData ?? Data()) ?? UIImage())
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: geo.size.width * 0.9)
                    .clipShape(StubShape())
                
                StubShape()
                    .foregroundStyle(.thinMaterial)
                
                Image(systemName: concert.iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
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
                .padding(.horizontal, 30)
            }
            // Main ZStack
            .frame(width: geo.size.width, height: geo.size.width * 0.60)
            .position(x: geo.size.width / 2, y: geo.size.height / 2 )
        }
        // Maximum height for GeometryReader
        .frame(maxHeight: 320)
    }
}

// MARK: StubStyle
// A struct for storing styles related to Stub

struct StubStyle {
    
    
    static let colors = ["red", "orange", "yellow", "green", "blue", "indigo", "purple", "cyan", "mint", "teal", "brown", "gray"]
    
    static let icons = ["guitars", "music.mic", "music.quarternote.3", "waveform", "hifispeaker.2", "music.note.list", "airpodsmax", "music.mic.circle", "speaker.wave.3", "music.note", "wave.3.forward"]
    
    static let gradientOverlay = LinearGradient( // For stub base
        colors: [.clear, .black.opacity(0.2)],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    
}

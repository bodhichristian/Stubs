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

    var stubColor: Color {
        return Color(colorName: concert.accentColor)!
    }
    
    @State private var iconTapped = false // For icon animation

    var body: some View {
        GeometryReader { geo in
            
            ZStack{
                // MARK: Stub base
                StubShape()
                    .foregroundStyle(stubColor)
                    .shadow(radius: 6, y: 10)
                
                StubShape()
                    .foregroundStyle(StubStyle.gradientOverlay)
                
                // MARK: Ticket Stub Elements
                HStack(alignment: .bottom) {
                    
                    VerticalLineBoundary() // Left Edge
                    
                    // MARK: Ticket Details
                    VStack(alignment: .leading) {
                        
                        // Artist Name
                        Text(concert.artistName)
                            .font(.title.bold())
                            .foregroundStyle(.white)
                            .shadow(radius: 2)
                        
                        // Venue Details
                        Text(concert.venue)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                        
                        HStack {
                            
                            // MARK: Location
                            VStack(alignment: .leading) {
                                
                                // City
                                Text(concert.city)
                                    .font(.title2)
                                    .foregroundStyle(.white)
                                                                
                                Spacer()
                                
                                HStack(alignment: .bottom){
                                    
                                    // MARK: Concert Date
                                    // Format: `Jun 9, 2023`
                                    Text(concert.date.formatted(date: .numeric, time: .omitted))
                                        .fontDesign(.monospaced)
                                        .font(.title2)
                                        .foregroundStyle(.black)
                                    
                                    if concert.isFavorite {
                                        
                                        FavoriteIcon()
                                        
                                    }
                                    
                                }
                                
                            }
                            
                            Spacer()
                            
                            VStack {
                                Spacer()
                                
                                // MARK: Concert icon
                                Image(systemName: concert.iconName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(
                                        width: geo.size.width * 0.2,
                                        height: geo.size.width * 0.2)
                                    .foregroundStyle(.white)
                                    .shadow(radius: 4, x: 2, y: 6)
                                    .symbolEffect(.bounce, options: .nonRepeating, value: iconTapped)
                                    .onTapGesture {
                                        iconTapped.toggle()
                                    }
                            }
                            
                        }
                    }
                    .padding(.leading)
                    
                    VerticalLineBoundary() // Right Edge
                
                }
                .padding(30)
                
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

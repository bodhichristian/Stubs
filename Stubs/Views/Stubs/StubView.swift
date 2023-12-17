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
    
    let gradient = LinearGradient( // For stub base
        colors: [.clear, .black.opacity(0.2), .black.opacity(0.4)],
        startPoint: .bottom,
        endPoint: .top
    )
    
    @State private var iconTapped = false // For icon animation
    
    var body: some View {
        GeometryReader { geo in
            
            ZStack{
                // MARK: Stub base
                StubShape()
                    .foregroundStyle(Color(colorName: concert.accentColor)!)
                    .shadow(radius: 6, y: 10)
                
                StubShape()
                    .foregroundStyle(gradient)
                
                // MARK: Ticket Stub Elements
                HStack(alignment: .bottom) {
                    
                    VerticalLineBoundary() // Left Edge
                    
                    // MARK: Ticket Details
                    VStack(alignment: .leading) {
                        
                        // Artist Name
                        Text(concert.artist)
                            .font(.title.bold())
                            .foregroundStyle(.white)
                            .shadow(radius: 2)
                        
                        HStack {
                            
                            // MARK: Location
                            VStack(alignment: .leading) {
                                
                                // Venue Details
                                Text(concert.venue)
                                    .font(.title2)
                                    .foregroundStyle(.black)
                                
                                // City
                                Text(concert.city)
                                    .font(.title2)
                                    .foregroundStyle(.white)
                                
                                Spacer()
                                
                                // MARK: Concert Date
                                // Format: `Jun 9, 2023`
                                Text(concert.date.formatted(date: .abbreviated, time: .omitted))
                                    .fontDesign(.monospaced)
                                    .font(.title2)
                                    .foregroundStyle(.black)
                                
                            }
                            
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
                                .onAppear {
                                    iconTapped.toggle()
                                }
                                .onTapGesture {
                                    iconTapped.toggle()
                                }
                            
                        }
                    }
                    
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

#Preview {
    StubView(concert: SampleData.concerts[0])
}

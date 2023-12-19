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
    let isAddingConcert: Bool
    
    let gradient = LinearGradient( // For stub base
        colors: [.clear, .black.opacity(0.2)],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
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
                            .font(isAddingConcert
                                  ? .title2
                                  : .title
                            )
                            .bold()
                            .foregroundStyle(.white)
                            .shadow(radius: 2)
                        
                        // Venue Details
                        Text(concert.venue)
                            .font(isAddingConcert
                                  ? .title3
                                  : .title2
                            )
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                        
                        HStack {
                            
                            // MARK: Location
                            VStack(alignment: .leading) {
                                
                                
                                
                                // City
                                Text(concert.city)
                                    .font(isAddingConcert
                                          ? .title3
                                          : .title2
                                    )
                                    .foregroundStyle(.white)
                                
                                Spacer()
                                
                                // MARK: Concert Date
                                // Format: `Jun 9, 2023`
                                Text(concert.date.formatted(date: .abbreviated, time: .omitted))
                                    .fontDesign(.monospaced)
                                    .font(isAddingConcert
                                          ? .title3
                                          : .title2
                                    )
                                    .foregroundStyle(.black)
                                
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

#Preview {
    StubView(concert: SampleData.concerts[0], isAddingConcert: false)
}

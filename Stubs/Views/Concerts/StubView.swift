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
        colors: [.clear, .black.opacity(0.3)],
        startPoint: .top,
        endPoint: .bottom
    )
    
    @State private var iconTapped = false // For icon animation
    
    var body: some View {
        GeometryReader { geo in
            
            ZStack{
                
                TicketShape()
                    .foregroundStyle(Color(colorName: concert.accentColor)!)
                    .shadow(radius: 6, y: 10)
                
                TicketShape()
                    .foregroundStyle(gradient)
                
                HStack(alignment: .bottom) {
                    
                    // Vertical Line Boundary
                    Rectangle()
                        .frame(width: 2)
                        .padding(.trailing, 10)
                    
                    // Concert Details
                    VStack(alignment: .leading) {
                        
                        // Artist Name
                        Text(concert.artist)
                            .font(.largeTitle.bold())
                            .foregroundStyle(.white)
                            .shadow(radius: 2)
                        
                        // Venue Details
                        Text(concert.venue)
                            .font(.title2)
                            .foregroundStyle(.black)
                        
                        Text(concert.city)
                            .font(.title2)
                            .foregroundStyle(.white)
                        
                        
                        Spacer()
                        
                        // Concert Date
                        // Format: `Jun 9, 2023`
                        Text(concert.date.formatted(date: .abbreviated, time: .omitted))
                            .fontDesign(.monospaced)
                            .font(.title2)
                            .foregroundStyle(.black)
                    }
                    
                    Spacer()
                    
                    // Concert icon
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
                    
                    // Vertical Line Boundary
                    Rectangle()
                        .frame(width: 2)
                        .padding(.leading, 10)
                    
                }
                .padding(30)
            }
            // Main ZStack
            .frame(width: geo.size.width, height: geo.size.width * 0.60)
            .position(x: geo.size.width / 2, y: geo.size.width / 2 )
        }
        // Maximum height for GeometryReader
        .frame(maxHeight: 320)
    }
}

#Preview {
    StubView(concert: SampleData.concerts[0])
}

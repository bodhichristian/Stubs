//
//  StubEditorPreview.swift
//  Stubs
//
//  Created by christian on 12/26/23.
//

import SwiftUI

struct StubEditorPreview: View {
    let concert: Concert
    
    let gradient = LinearGradient( // For stub base
        colors: [.clear, .black.opacity(0.2)],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    @State private var iconTapped = false
    
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
                            .font(.title2)
                            .bold()
                            .foregroundStyle(.white)
                            .shadow(radius: 2)
                        
                        // Venue Details
                        Text(concert.venue)
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                        
                        HStack {
                            
                            // MARK: Location
                            VStack(alignment: .leading) {
                                                            
                                // City
                                Text(concert.city)
                                    .foregroundStyle(.white)
                                
                                Spacer()
                                
                                // MARK: Concert Date
                                // Format: `Jun 9, 2023`
                                Text(concert.date.formatted(date: .abbreviated, time: .omitted))
                                    .fontDesign(.monospaced)
                                    .foregroundStyle(.black)
                                
                            }
                            .font(.title3)

                            
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
        // GeometryReader Frame
        .frame(minHeight: 250)
        .frame(maxHeight: 320)
    }
}
#Preview {
    StubEditorPreview(concert: SampleData.concerts[0])
}

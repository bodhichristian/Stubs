//
//  StubView.swift
//  Stubs
//
//  Created by christian on 7/8/23.
//

import SwiftUI

// MARK: StubView - SwiftUI View
// A View that represents a ticket stub
// Available in multiple sizes

enum StubSize {
    case small
    case large
}

struct StubView: View {
    let concert: Concert
    let size: StubSize
    
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
                    Rectangle()
                        .frame(width: 2)
                        .padding(.trailing, 10)
                    
                    // Concert Details
                    VStack(alignment: .leading) {
                        
                        // Artist Name
                        Text(artistName)
                            .font(titleFont)
                            .foregroundStyle(.white)
                            .shadow(radius: 2)
                        
                        // Venue Details
                        if size == .large {
                            Text(concert.venue)
                                .font(secondaryFont)
                                .foregroundStyle(.black)
                            
                            Text(concert.city)
                                .font(secondaryFont)
                                .foregroundStyle(.white)
                        }
                        
                        Spacer()
                        
                        // Concert Date
                        Text(concert.date.formatted(date: .abbreviated, time: .omitted)) // Format: Jun 9, 2023
                            .fontDesign(.monospaced)
                            .font(secondaryFont)
                            .foregroundStyle(.black)
                    }
                    
                    Spacer()
                    
                    Image(systemName: concert.iconName) // Concert icon
                        .resizable()
                        .scaledToFit()
                        .frame(
                            width: size == .small ? 30 : geo.size.width * 0.2,
                            height: size == .small ? 30 : geo.size.width * 0.2)
                        .foregroundStyle(.white)
                        .shadow(radius: 4, x: 2, y: 6)
                        .symbolEffect(.bounce, options: .nonRepeating, value: iconTapped)
                        .onAppear {
                            iconTapped.toggle()
                        }
                        .onTapGesture {
                            iconTapped.toggle()
                        }
                    
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
    StubView(concert: SampleData.concerts[0], size: .small)
}

extension StubView {
    // Create a display-ready artist name, truncate where needed
    private var artistName: String {
        switch size {
        case .small:
            if concert.artist.count > 15 {
                return (concert.artist.prefix(15) + "...")
            } else {
                return concert.artist
            }
            
        default:
            return concert.artist
        }
    }
    
    // Calculate font weight based on StubSize
    private var titleFont: Font {
        switch size {
        case .small:
            return .title3.bold()
        default:
            return .largeTitle.bold()
        }
    }
    // Calculate font weight based on StubSize
    private var secondaryFont: Font {
        switch size {
        case .small:
            return .subheadline.bold()
        default:
            return .title2
        }
    }
}


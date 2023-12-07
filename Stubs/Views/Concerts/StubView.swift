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
        colors: [.clear, .black.opacity(0.5)],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    @State private var iconTapped = false // For icon animation
    
    var body: some View {
        ZStack(alignment: .center) {
            ticketStubBase
            concertDetails
        }
        //.padding(.horizontal)
    }
}

#Preview {
    StubView(concert: SampleData.concerts[0], size: .large)
}

extension StubView {
    // Create stub base, color, and icon
    private var ticketStubBase: some View {
        GeometryReader { geo in
            ZStack(alignment: .bottomTrailing) {
                RoundedRectangle(cornerRadius: 20) // Stub Background
                    .foregroundStyle(Color(colorName: concert.accentColor)!)
                    .frame(
                        width: size == .small ? 200 : geo.size.width * 0.9,
                        height: size == .small ? 100 : geo.size.width * 0.63)
                    .shadow(radius: 6, y: 10)
                
                RoundedRectangle(cornerRadius: 20) // Gradient overlay
                    .foregroundStyle(gradient)
                    .frame(
                        width: size == .small ? 200 : geo.size.width * 0.9,
                        height: size == .small ? 100 : geo.size.width * 0.63)
                
                Image(systemName: concert.iconName) // Concert icon
                    .resizable()
                    .scaledToFit()
                    .frame(
                        width: size == .small ? 30 : geo.size.width * 0.2,
                        height: size == .small ? 30 : geo.size.width * 0.2)
                    .foregroundStyle(.white)
                    .shadow(radius: 4, x: 2, y: 6)
                    .padding(size == .small ? 30 : 25)
                    .symbolEffect(.bounce, options: .nonRepeating, value: iconTapped)
                    .onAppear {
                        iconTapped.toggle()
                    }
                    .onTapGesture {
                        iconTapped.toggle()
                    }
            }
            .position(x: geo.size.width / 2, y: geo.size.width / 2)
        }
    }
    // Display concert details
    private var concertDetails: some View {
        GeometryReader { geo in
            
            VStack(alignment: .leading) {
                Spacer()
                Text(artistName)
                    .font(titleFont)
                    .foregroundStyle(.white)
                    .shadow(radius: 2)
                    
                
                if size == .large {
                    Text(concert.venue)
                        .font(secondaryFont)
                        .foregroundStyle(.black)
                    
                    Text(concert.city)
                        .font(secondaryFont)
                        .foregroundStyle(.white)
                }
                
                Spacer()
                
                Text(concert.date.formatted(date: .abbreviated, time: .omitted)) // Format: Jun 9, 2023
                    .font(secondaryFont)
                    .foregroundStyle(.black)
            }
            .frame(height: size == .small ? 70 : geo.size.height * 0.7)
            .padding(size == .small ? 30 : 40)
        }
    }
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


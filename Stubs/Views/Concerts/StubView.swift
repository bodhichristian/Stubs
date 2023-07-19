//
//  StubView.swift
//  Stubs
//
//  Created by christian on 7/8/23.
//

import SwiftUI

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
        ZStack(alignment: .topLeading) {
            ticketStubBase
            concertDetails
        }
        .padding(.horizontal)
    }
}

#Preview {
    StubView(concert: SampleData.concerts[0], size: .large)
}

extension StubView {
    // Create stub base, color, and icon
    private var ticketStubBase: some View {
        ZStack(alignment: .bottomTrailing) {
            RoundedRectangle(cornerRadius: 20) // Stub Background
                .foregroundStyle(Color(colorName: concert.accentColor)!)
                .frame(
                    width: size == .small ? 200 : 400,
                    height: size == .small ? 100 : 280)
                .shadow(radius: 6, y: 10)
                .padding()
            
            RoundedRectangle(cornerRadius: 20) // Gradient overlay
                .foregroundStyle(gradient)
                .frame(
                    width: size == .small ? 200 : 400,
                    height: size == .small ? 100 : 280)
                .padding()
            
            Image(systemName: concert.iconName) // Concert icon
                .resizable()
                .scaledToFit()
                .frame(
                    width: size == .small ? 30 : 80,
                    height: size == .small ? 30 : 80)
                .foregroundStyle(.white)
                .shadow(radius: 4, y: 6)
                .padding(size == .small ? 30 : 40)
                .symbolEffect(.bounce, options: .nonRepeating, value: iconTapped)
                .onAppear {
                    iconTapped.toggle()
                }
                .onTapGesture {
                    iconTapped.toggle()
                }
        }
    }
    // Display concert details
    private var concertDetails: some View {
        VStack(alignment: .leading) {
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
                .foregroundStyle(.white)
        }
        .frame(height: size == .small ? 70 : 210)
        .padding(size == .small ? 30 : 40)
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
            return .title2.bold()
        }
    }
}


//
//  StubCountIndicator.swift
//  Stubs
//
//  Created by christian on 1/15/24.
//

import SwiftUI
import SwiftData

struct StubCountIndicator: View {
    let artist: Artist
    
    @Query var concerts: [Concert]

    private var stubCount: Int {
        var count = 0
        
        for concert in concerts {
            if concert.artistName.lowercased() == artist.artistName?.lowercased() {
                count += 1
            }
        }
        
        return count
    }
    
    private var gradientColors: [Color] {
            switch stubCount {
            case 1: // 1 Stub
                return [.white, .green, .green, .gray]
            case 2: // 2 Stubs
                return [.white, .blue, .blue, .gray]
            case 3: //3 Stubs
                return [.white, .indigo, .indigo, .gray]
            case 4: // 4 Stubs
                return [.white, .purple, .purple, .gray]
            default: // 5+ Stubs
                return [.white, .orange, .orange, .gray]
            }
        }
    
    var body: some View {
        ZStack {
            if stubCount > 1 {
                StubShape()
                    .foregroundStyle(.white)
                    .rotationEffect(Angle(degrees: 15))
                    .frame(width: 42, height: 28)

                StubShape()
                    .foregroundStyle(.gray)
                    .rotationEffect(Angle(degrees: 30))
                    .frame(width: 42, height: 28)

            }
            
            StubShape()
                .frame(width: 42, height: 28)
                .foregroundStyle(
                    LinearGradient(
                        colors: gradientColors,
                        startPoint: .topLeading,
                        endPoint:  .bottomTrailing
                    )
                )
            
            HStack {
                VerticalLineBoundary()
                Spacer()
                VerticalLineBoundary()
            }
            .frame(width: 32, height: 28)
            
            Text(String(stubCount))
                .foregroundStyle(.white)
                .shadow(radius: 3)
                .rotationEffect(Angle(degrees: 15))

        }
        .rotationEffect(Angle(degrees: -15))
        .shadow(radius: 2)
    }
}


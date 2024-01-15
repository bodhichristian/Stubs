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
    
    private let gradient = LinearGradient(
        colors: [.white, .green, .green, .gray],
        startPoint: .topLeading,
        endPoint:  .bottomTrailing
    )
    
    private var stubCount: Int {
        var count = 0
        
        for concert in concerts {
            if concert.artistName == artist.strArtist {
                count += 1
            }
        }
        
        return count
    }
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 25)
                .foregroundStyle(gradient)
            Text(String(stubCount))
                .foregroundStyle(.white)
        }
        .offset(x: 4, y: 4)
    }
}


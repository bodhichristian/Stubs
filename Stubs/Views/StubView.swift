//
//  StubView.swift
//  Stubs
//
//  Created by christian on 6/9/23.
//

import SwiftUI

struct StubView: View {
    let concert: Concert
    
    let gradient = LinearGradient( // For stub base
        colors: [.clear, .black.opacity(0.5)],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            // MARK: Stub Base
            ZStack(alignment: .bottomTrailing) {
                RoundedRectangle(cornerRadius: 20) // Stub Background
                    .foregroundStyle(Color(colorName: concert.accentColor)!)
                    .frame(height: 400)
                    .shadow(radius: 6, y: 10)
                    .padding()
                
                RoundedRectangle(cornerRadius: 20) // Gradient overlay
                    .foregroundStyle(gradient)
                    .frame(height: 400)
                    .padding()
                
                Image(systemName: concert.iconName) // Concert icon
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .foregroundStyle(.white)
                    .shadow(radius: 4, y: 6)
                    .padding(40)
            }
            
            // MARK: Concert Details
            VStack(alignment: .leading) {
                Text(concert.artist)
                    .font(.largeTitle).bold()
                    .foregroundStyle(.white)
                    .shadow(radius: 2)
                
                Text(concert.venue)
                    .font(.title2).bold()
                    .foregroundStyle(.black)
                
                Text(concert.city)
                    .font(.title2).bold()
                    .foregroundStyle(.white)
                
                Spacer()
                
                Text(concert.date.formatted(date: .abbreviated, time: .omitted)) // Format: Jun 9, 2023
                    .font(.title2).bold()
                    .foregroundStyle(.white)
            }
            .frame(height: 330)
            .padding(40)
        }
        .navigationTitle("Stub")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

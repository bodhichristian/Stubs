//
//  MKMapSnapshotterTest.swift
//  Stubs
//
//  Created by christian on 1/30/24.
//

import MapKit
import SwiftUI


struct VenueGridItem: View {
    let concert: Concert
    
    @Environment(\.colorScheme) var colorScheme
    
    private let gradient = LinearGradient(
        colors: [
            .black.opacity(0.8),
            .clear,
            .clear
        ],
        startPoint: .top,
        endPoint: .bottom
    )
    
    private var shadowColor: Color {
        colorScheme == .dark ? Color(white: 0.9) : .secondary
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Image(uiImage: UIImage(data: concert.mapSnapshotData ?? Data()) ?? UIImage())
                .resizable()
                .scaledToFill()
            
            gradient
            
            VStack(alignment: .leading) {
                Text(concert.venue)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(concert.city)
                    .font(.headline)
            }
            .foregroundStyle(.white)
            .padding(10)
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .frame(minHeight: 150)
        .shadow(color: shadowColor, radius: 2)
        .padding(2)
    }
}

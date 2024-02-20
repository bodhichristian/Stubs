//
//  MKMapSnapshotterTest.swift
//  Stubs
//
//  Created by christian on 1/30/24.
//

import MapKit
import SwiftUI


struct VenueTile: View {
    let concert: Concert
    @Binding var listView: Bool
    
    var body: some View {
        ZStack() {
            Image(uiImage: UIImage(data: concert.mapSnapshotData ?? Data()) ?? UIImage())
                .resizable()
                .scaledToFill()
                .frame(height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            TileBase()
            
            VStack(alignment: .leading) {

                Text(concert.venue)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .foregroundStyle(.white)
                
                Text("📍" + concert.city)
                    .font(listView ? .headline : .subheadline)
                    .foregroundStyle(.secondary)
                    .offset(x: -4)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            .padding()

        }
        
        .frame(height: 120)
        .padding(.horizontal, 2)
    }
}

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
                .frame(height: listView ? 80 : 120)
                .frame(maxWidth: listView ? .infinity : 150)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            TileBase()
            
            VStack(alignment: .leading) {
                Text(concert.venueName)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                
                Text("📍" + concert.city)
                    .font(listView ? .headline : .subheadline)
                    .foregroundStyle(.secondary)
                    .offset(x: -4)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
        .frame(height: listView ? 80 : 120)
        .contentShape(RoundedRectangle(cornerRadius: 10))
        .padding(.horizontal, 2)
    }
}

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
            
            HStack {
                Image(uiImage: UIImage(data: concert.mapSnapshotData ?? Data()) ?? UIImage())
                    .resizable()
                    .scaledToFill()
                    .frame(width: listView ? 60 : 40)
                    .clipShape(Circle())
                    .shadow(radius: 3, y: 2)
                    .padding(.leading)
                
                
                VStack(alignment: .leading) {
                    Text(concert.venue)
                        .font(listView ? .title2 : .headline)
                        .fontWeight(.semibold)
                    
                    Text(concert.city)
                        .font(listView ? .headline : .subheadline)
                        .foregroundStyle(.secondary)
                }
                .padding(10)
                
                Spacer()
            }
        }
        
        .frame(height: 80)
        .padding(.horizontal, 2)
    }
}

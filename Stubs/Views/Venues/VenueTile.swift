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
            
//            HStack {
//                Image(uiImage: UIImage(data: concert.mapSnapshotData ?? Data()) ?? UIImage())
//                    .resizable()
//                    .scaledToFill()
//                    .frame(width: listView ? 60 : 50)
//                    .clipShape(Circle())
//                    .overlay {
//                        Circle()
//                            .stroke(lineWidth: 1)
//                            .foregroundStyle(.white)
//                    }
//                    .shadow(radius: 4, y: 2)
//                    
                    VStack(alignment: .leading) {
                        
                        
                        
                        Text(concert.venue)
                            .font(listView ? .title2 : .headline)
                            //.fontWeight(.semibold)
                            .lineLimit(2)
                            .foregroundStyle(.white)
                        
                        Text(concert.city)
                            .font(listView ? .headline : .subheadline)
                            .foregroundStyle(.secondary)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)

                    .padding(10)
                    
                
//            }
//            .padding(.leading)
        }
        
        .frame(height: 120)
        .padding(.horizontal, 2)
    }
}

//
//  ArtistDetailVenuesMap.swift
//  Stubs
//
//  Created by christian on 12/28/23.
//

import SwiftUI
import MapKit

struct ArtistDetailVenuesMap: View {
    let venues: Set<String>
    let defaultCoordinates = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    
    
    @State private var location: MKMapItem?
    @State private var position: MapCameraPosition = .automatic
    
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack{
                Spacer()
                Text("\(venues.count) Venues" )
                
                Image(systemName: "mappin.and.ellipse")
                    .foregroundStyle(.green)
                
               
            }
            .font(.title2)
            .fontWeight(.bold)

            
            Map {
                
            }
            .frame(maxWidth: .infinity)
            .frame(height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            

        }
        .padding(.horizontal)
        
    }
}


#Preview {
    ArtistDetailVenuesMap(venues: Set<String>())
}

//
//  ArtistDetailVenuesMap.swift
//  Stubs
//
//  Created by christian on 12/28/23.
//

import SwiftUI
import SwiftData
import MapKit

struct ArtistDetailVenuesMap: View {
    
    // Pass in filteredConcerts from ArtistDetailView
    let concerts: [Concert]
    
    
    @State private var location: MKMapItem?
    @State private var position: MapCameraPosition = .automatic
    
    //
    private var uniqueVenueCount: Int {
        return Set(concerts.map {$0.venue}).count
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack{
                Spacer()
                Text("\(uniqueVenueCount) Venues" )
                
                Image(systemName: "mappin.and.ellipse")
                    .foregroundStyle(.green)
                
               
            }
            .font(.title2)
            .fontWeight(.bold)

            
            Map(position: $position) {
                ForEach(concerts, id: \.uuid) { concert in
                    Annotation("", coordinate: CLLocationCoordinate2D(latitude: concert.venueLatitude, longitude: concert.venueLongitude)) {
                        StubThumbnail(concert: concert)
                            .offset(x: Double.random(in: 0.0...6.0))
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .onAppear {
                position = .camera(MapCamera(centerCoordinate: CLLocationCoordinate2D(latitude: concerts[0].venueLatitude, longitude: concerts[0].venueLongitude), distance: 400000))
            }
        }
        .padding(.horizontal)
        
    }
}


#Preview {
    ArtistDetailVenuesMap(concerts: SampleData.concerts)
}

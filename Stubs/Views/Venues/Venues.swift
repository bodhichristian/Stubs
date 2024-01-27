//
//  Venues.swift
//  Stubs
//
//  Created by christian on 1/26/24.
//

import SwiftUI
import MapKit
import SwiftData

struct Venues: View {
    @Query var concerts: [Concert]
    
    @State private var location: MKMapItem?
    @State private var position: MapCameraPosition = .automatic
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                Map(position: $position, selection: $location) {
                    ForEach(concerts, id: \.uuid) { concert in
                        
                        
                        Marker(
                            concert.venue,
                            coordinate: CLLocationCoordinate2D(
                                latitude: concert.venueLatitude,
                                longitude: concert.venueLongitude
                            )
                        )
                        
                        
                            
                    }
                }
                .padding(.bottom, 60)
                .onAppear {
                    location = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: concerts.first?.venueLatitude ?? 0.0, longitude: concerts.first?.venueLongitude ?? 0.0)))
                    
                    position = .camera(
                        MapCamera(
                            centerCoordinate: CLLocationCoordinate2D(
                                latitude: concerts.first?.venueLatitude ?? 0.0,
                                longitude: concerts.first?.venueLongitude ?? 0.0
                            ),
                            
                            distance: 12000000,
                            heading: 100,
                            pitch: 60)

                    )
                    
                    
                    
                    
                }
            }
            .navigationTitle("Venues")
            .toolbarBackground(.hidden, for: .navigationBar)
        }
    }
}

#Preview {
    Venues()
}

//
//  VenueMapView.swift
//  Stubs
//
//  Created by christian on 6/26/23.
//

import SwiftUI
import MapKit

// MARK: VenueMapView
// A View for displaying a concert's venue on a map

struct VenueMapView: View {
    let concert: Concert
    
    @Environment(\.dismiss) var dismiss
    
    @State private var location: MKMapItem?
    @State private var position: MapCameraPosition = .automatic
    
    private let defaultCoordinates = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    
    private var query: String { // Creates the location query
        return concert.venue + " venue " + concert.city
    }
    
    private var venueCoordinates: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(
            latitude: concert.venueLatitude,
            longitude: concert.venueLongitude
        )
    }
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .topLeading) {
                // Apple Maps base
                Map(position: $position, selection: $location) {
                    // Default Map Marker
                    Marker(concert.venue, coordinate: venueCoordinates)
                }
                .mapStyle(
                    .imagery(
                        elevation: .realistic
                    )
                )
                
                // MARK: mapControls
                // Content will be placed in default positions
                .mapControls {
                    // Appears when map has been rotated by user
                    MapCompass()
                    // Appears while user is zooming in or out
                    MapScaleView(anchorEdge: .trailing)
                    
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Back")
                        .onTapGesture {
                            dismiss()
                        }
                }
            }
            .onAppear {
                location = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: concert.venueLatitude, longitude: concert.venueLongitude)))
                
                position = .camera(
                    MapCamera(
                        centerCoordinate: CLLocationCoordinate2D(
                            latitude: concert.venueLatitude,
                            longitude: concert.venueLongitude
                        ),
                        
                        distance: 1200,
                        heading: 100,
                        pitch: 60)
                )
            }
        }
    }
}

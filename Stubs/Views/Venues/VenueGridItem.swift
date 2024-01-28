//
//  VenueGridItem.swift
//  Stubs
//
//  Created by christian on 1/27/24.
//

import SwiftUI
import MapKit

struct VenueGridItem: View {
    let concert: Concert
    let cameraDistance: Double = 800

    @State private var location: MKMapItem?
    @State private var position: MapCameraPosition = .automatic
    @Environment(\.colorScheme) var colorScheme
    
    private var shadowColor: Color {
        if colorScheme == .dark {
            return Color(white: 0.9)
        } else {
            return .secondary
        }
    }
    
    var body: some View {
        Map(position: $position) {
            Marker(
                concert.venue,
                coordinate: CLLocationCoordinate2D(
                    latitude: concert.venueLatitude,
                    longitude: concert.venueLongitude
                )
            )
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .frame(maxWidth: .infinity)
        .frame(height: 150)
        .shadow(color: shadowColor, radius: 2)
        .onAppear {
            updateMapPosition(latitude: concert.venueLatitude, longitude: concert.venueLongitude)
        }
    }
    
    private func updateMapPosition(latitude: Double, longitude: Double) {
        position = .camera(
            MapCamera(
                centerCoordinate: CLLocationCoordinate2D(
                    latitude: latitude,
                    longitude: longitude
                ),
                distance: cameraDistance,
                heading: 400,
                pitch: 80
            )
        )
    }
}


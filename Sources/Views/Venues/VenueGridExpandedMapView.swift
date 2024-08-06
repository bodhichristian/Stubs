//
//  VenueGridItem.swift
//  Stubs
//
//  Created by christian on 1/27/24.
//

import SwiftUI
import MapKit

struct VenueGridExpandedMapView: View {
    let concert: Concert
    let cameraDistance: Double = 200
    
    @Environment(\.colorScheme) var colorScheme
    @State private var location: MKMapItem?
    @State private var position: MapCameraPosition = .automatic
    @State private var interactionModes: MapInteractionModes = []
    
    private let gradient = LinearGradient(
        colors: [.black.opacity(0.7), .clear],
        startPoint: .top,
        endPoint: .bottom
    )
    
    private var shadowColor: Color {
        if colorScheme == .dark {
            return Color(white: 0.9)
        } else {
            return .secondary
        }
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Map(position: $position) {
                
                
            }
            //.mapStyle(.standard(pointsOfInterest: .excludingAll))
            .mapStyle(.imagery(elevation: .realistic))
            .onAppear {
                withAnimation(.easeInOut(duration: 5.0)){
                    updateMapPosition(
                        latitude: concert.venue?.latitude ?? 0.0,
                        longitude: concert.venue?.longitude ?? 0.0
                    )
                }
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: shadowColor, radius: 2)
        .padding(2)
    }
    
    private func updateMapPosition(latitude: Double, longitude: Double) {
        position = .camera(
            MapCamera(
                centerCoordinate: CLLocationCoordinate2D(
                    latitude: latitude,
                    longitude: longitude
                ),
                distance: cameraDistance,
                heading: 90,
                pitch: 85
            )
        )
    }
}


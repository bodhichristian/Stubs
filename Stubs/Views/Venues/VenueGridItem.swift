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
    @State private var mapImage: UIImage?
    @State private var interactionModes: MapInteractionModes = []
    @Environment(\.colorScheme) var colorScheme
    
    private let gradient = LinearGradient(
        colors: [.black.opacity(0.7), .clear],
        startPoint: .top,
        endPoint: .center
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
            if let mapImage = mapImage {
                Image(uiImage: mapImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
        
                
            gradient
                
            VStack(alignment: .leading) {
                Text(concert.venue)
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Text(concert.city)
                    .font(.caption)
            }
            .foregroundStyle(.white)
            .padding(10)
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: shadowColor, radius: 2)

        .padding(2)
        
        .onAppear {
            updateMapPosition(latitude: concert.venueLatitude, longitude: concert.venueLongitude)
            generateMapSnapshot(
                latitude: concert.venueLatitude,
                longitude: concert.venueLongitude
            )
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
                heading: 90,
                pitch: 85
            )
        )
    }
    
    private func generateMapSnapshot(latitude: Double, longitude: Double) {
         let options = MKMapSnapshotter.Options()
         options.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), latitudinalMeters: 1000, longitudinalMeters: 1000)
         options.size = CGSize(width: 300, height: 300)
         options.scale = UIScreen.main.scale
        options.camera = MKMapCamera(lookingAtCenter: CLLocationCoordinate2D(latitude: concert.venueLatitude, longitude: concert.venueLongitude), fromEyeCoordinate: CLLocationCoordinate2D(latitude: concert.venueLatitude, longitude: concert.venueLongitude), eyeAltitude: 2000.0)
        
         let snapshotter = MKMapSnapshotter(options: options)
         snapshotter.start { snapshot, error in
             guard let snapshot = snapshot else {
                 print("Error capturing snapshot: \(error?.localizedDescription ?? "unknown error")")
                 return
             }
             self.mapImage = snapshot.image
         }
     }
}


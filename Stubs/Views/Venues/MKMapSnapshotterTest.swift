//
//  MKMapSnapshotterTest.swift
//  Stubs
//
//  Created by christian on 1/30/24.
//

import MapKit
import SwiftUI


struct MKMapSnapshotterTest: View {
    let concert: Concert
    let cameraDistance: Double = 800
    
    @State private var mapImage: UIImage?
    @Environment(\.colorScheme) var colorScheme
    
    
    private let gradient = LinearGradient(
        colors: [
            .black.opacity(0.8),
            .clear,
            .clear
        ],
        startPoint: .top,
        endPoint: .bottom
    )
    
    private var shadowColor: Color {
        colorScheme == .dark ? Color(white: 0.9) : .secondary
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
//            if let mapImage = mapImage {
//                Image(uiImage: mapImage)
//                    .resizable()
//                    .scaledToFill()
//                
//            }
            
            if let uiImage = UIImage(data: concert.mapImageData ?? Data()) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
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
        .frame(minHeight: 150)
        .shadow(color: shadowColor, radius: 2)
        .padding(2)
        .onAppear {
            //generateMapSnapshot(latitude: concert.venueLatitude, longitude: concert.venueLongitude)
        }
    }
    
//    private func generateMapSnapshot(latitude: Double, longitude: Double) {
//        let options = MKMapSnapshotter.Options()
//        options.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), latitudinalMeters: 200, longitudinalMeters: 200)
//        options.size = CGSize(width: 360, height: 150)
//        options.scale = UIScreen.main.scale
//        
//        let snapshotter = MKMapSnapshotter(options: options)
//        snapshotter.start { snapshot, error in
//            guard let snapshot = snapshot else {
//                print("Error capturing snapshot: \(error?.localizedDescription ?? "unknown error")")
//                return
//            }
//            self.mapImage = snapshot.image
//        }
//    }
}

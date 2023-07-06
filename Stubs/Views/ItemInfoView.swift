//
//  ItemInfoView.swift
//  Stubs
//
//  Created by christian on 7/6/23.
//

import SwiftUI
import MapKit

struct ItemInfoView: View {
    @State private var lookAroundScene: MKLookAroundScene?
    
    var location: MKMapItem // Currently selected POI
    var route: MKRoute?
    
    // Calculate travel time based on the provided route
    private var travelTime: String? {
        guard let route else { return nil }
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .abbreviated
        formatter.allowedUnits = [.hour, .minute]
        return formatter.string(from: route.expectedTravelTime)
    }
    
    var body: some View {
        LookAroundPreview(initialScene: lookAroundScene)
            .overlay(alignment: .bottomTrailing) {
                HStack {
                    Text("\(location.name ?? "")")
                    if let travelTime {
                        Text(travelTime)
                    }
                }
                .font(.caption)
                .foregroundStyle(.white)
                .padding(10)
            }
            .onAppear {
                getLookAroundScene()
            }
            .onChange(of: location) {
                getLookAroundScene()
            }
    }
    
    func getLookAroundScene() {
        lookAroundScene = nil
        Task {
            let request = MKLookAroundSceneRequest(mapItem: location)
            lookAroundScene = try? await request.scene
        }
    }
}

#Preview {
    ItemInfoView(location: MKMapItem(
        placemark: MKPlacemark(
            coordinate: CLLocationCoordinate2D(latitude: 40.7305, longitude: -73.9934)))
    )
}
